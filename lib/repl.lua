repl = {}

function repl.footer()
  local width = config.cols
  local ni_width = 20
  local date_width = 21
  local void = ""
  if config.cols > ni_width + date_width then
    for i = 1, config.cols - ni_width - date_width do
      void = void .. " "
    end
  end
  return os.date("@ %Y-%m-%d %H:%M:%S") .. void .. "Northern Information"
end

repl.methods = {
  ai = function()
    mesh:field()
    return repl.footer()
  end
}

return setmetatable(repl, {
  __index = function(self, index)
    if self.methods[index] ~= nil then
      return self.methods[index]()
    end
  end,
  __newindex = function(self, k, v)
    print(k, v)
  end
})