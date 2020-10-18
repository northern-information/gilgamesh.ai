api = {}

function api.init()
  
end

function api:curl_request(url)
  return util.os_capture("curl -sS --max-time 20 \"" .. url .. "\"", true)
end

return api