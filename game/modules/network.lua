local M = {}

-- Defold's built-in WebSocket module
local websocket = require("websocket")

local socket = nil
local connected = false
local opponent_url = nil

-- Connect to your Node.js Render server
function M.connect(url)
    local headers = { auth = "Bearer " .. (sys.get_config_string("session.token") or "") }
    socket, opponent_url = websocket.connect(url, nil, headers)
    
    if socket then
        connected = true
        print("Connected to Skyvionix Render Server!")
    else
        print("Connection failed.")
    end
end

-- Send your current X position to the server
function M.send_position(x)
    if connected and socket then
        local msg = string.format('{"action":"sync","x":%.3f}', x)
        websocket.send(socket, msg)
    end
end

-- Listen for the opponent's position in the game loop
function M.update(self, dt)
    if not connected or not socket then return end
    
    local message = websocket.receive(socket)
    if message then
        -- Parse JSON (assuming you send {"x": 1.2, "y": 0.5} from Render)
        local opponent_x = tonumber(string.match(message, '"x":([-0-9.]+)'))
        if opponent_x and self.ghost_ship then
            -- Move the ghost ship instantly to match the opponent
            go.set_position(vmath.vector3(opponent_x, 0, -1.5), self.ghost_ship)
        end
    end
end

return M
