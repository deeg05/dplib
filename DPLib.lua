--[[
    DoorProtocol library
    This library is made to communicate with server using DoorProtocol
    Authors: Deeg05, Phorcys
]]
local component = require("component")
local thread    = require("thread")
local m         = component.modem

local door = {}

m.open(1337)

function door.openclose(doorName)
    thread.create(function(doorName)
        m.broadcast(1337, "open" .. doorName)
        os.sleep(2)
        m.broadcast(1337, "close" .. doorName)
    end, doorName)
end

function door.open(doorName)
    thread.create(function(doorName)
        m.broadcast(1337, "open" .. doorName)
    end, doorName)
end

function door.close(doorname)
    thread.create(function(doorName)
        m.broadcast(1337, "close" .. doorName)
    end, doorName)
end

return door
