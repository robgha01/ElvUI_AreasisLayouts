--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)
local mod = E:GetModule("Areasis Layouts")
local queue = {}

local function tableToPluginFormat(tbl, profileText)
    local lineStructureTable = {}
    local lineStructure = ""
    local sameLine = false

    local function buildLineStructure()
        local str = profileText
        for _, v in ipairs(lineStructureTable) do
            if (type(v) == "string") then
                str = str .. '["' .. v .. '"]'
            else
                str = str .. "[" .. v .. "]"
            end
        end
        return str
    end

    local function traverse(node, isChild)
        local tmp = ""
        lineStructure = buildLineStructure()
        for key, value in pairs(node) do
            if (not sameLine) then
                tmp = tmp .. lineStructure
            end

            tmp = tmp .. "["
            local valueType = type(value)
            if (type(key) == "string") then
                tmp = tmp .. '"' .. key .. '"'
            else
                tmp = tmp .. key
            end

            if (valueType == "table") then
                table.insert(lineStructureTable, key)
                sameLine = true
                tmp = string.format("%s]%s", tmp, traverse(value, true))
            else
                sameLine = false
                tmp = tmp .. "] = "

                if (valueType == "number") then
                    tmp = tmp .. value .. ";\n"
                elseif (valueType == "string") then
                    tmp = tmp .. '"' .. value:gsub("\\", "\\\\"):gsub("\n", "\\n"):gsub('"', '\\"') .. '";\n'
                elseif (valueType == "boolean") then
                    if (value) then
                        tmp = tmp .. "true;\n"
                    else
                        tmp = tmp .. "false;\n"
                    end
                else
                    tmp = tmp .. '"' .. tostring(value) .. '"\n'
                end
            end
            if isChild == nil then
                --tmp = string.gsub(tmp, "(.-)%s*$", "%1")
                coroutine.yield(tmp)
                tmp = ""
            end
        end

        table.remove(lineStructureTable)
        lineStructure = buildLineStructure()
        return tmp
    end

    local co = coroutine.create(function() traverse(tbl) end)
    return function()
        local success, returnValue = coroutine.resume(co)
        if success then
            return returnValue
        end
        print("There was an error:", returnValue)
    end
end

function mod:QueueTable(tbl, profileTextOrFormatter)
    if type(profileTextOrFormatter) == "string" then
        table.insert(queue, {tbl = tbl, profileText = profileTextOrFormatter})
    elseif type(profileTextOrFormatter) == "function" then
        table.insert(queue, {tbl = tbl, profileText = "", formatter = profileTextOrFormatter})
    else
        error("profileTextOrFormatter must be a function or string but it is " ..type(profileTextOrFormatter))
    end
end

function mod:ProcessQueue(callback)
    local d = ""
    for _, v in ipairs(queue) do
        if v.formatter then
            d = d .. v:formatter(v.tbl)
        else
            for data in tableToPluginFormat(v.tbl, v.profileText) do
                d = d .. data
            end
        end        
    end
    callback(d)
    collectgarbage() -- force a garbage collection
end