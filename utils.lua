
local function send_frame(ip, port, frame)
    local url = "http://" .. ip .. ":" .. port .. "/send"
    local frame_list = {frame}
    local json = textutils.serialiseJSON(frame_list)
    
    local headers = {
        ["Content-Type"] = "application/json"
    }
    
    local response = http.post(url, json, headers)
    
    if response then
        return true
    else
        return false
    end
end

local function recv_frames(ip, port, ammount)
   local url = "http://" .. ip .. ":" .. port .. "/recv/" .. ammount
   local response = http.get(url)
   
   if response then
       return textutils.unserialiseJSON(response.readAll())
   else
       return nil
   end
end

return {send_frame = send_frame. recv_frames = recv_frames}
