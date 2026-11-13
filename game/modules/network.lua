local M = {}

local is_web = (html5 ~= nil)

function M.connect(url)
    if is_web then
        html5.run('window.connectSkyvionixWS("' .. url .. '")')
        print("Requesting WebSocket connection via JS bridge...")
    else
        print("Not running on web, skipping WebSocket.")
    end
end

function M.send_position(x)
    if is_web then
        html5.run(string.format("window.sendPlayerPos(%.3f)", x))
    end
end

function M.update(self, dt)
    -- The JS bridge will call back into Lua via html5.set_listener
end

return M
