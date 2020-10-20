mesh = {}

function mesh.init()
  mesh.buffer = ""
  mesh.chars = {
    corner = "+",
    field = ".",
    decorative = "-"
  }
end

function mesh:field()
  self:buffer_reset()
  self:make_bookend(true)
  for r = 1, config.rows do
    for c = 1, config.cols do
      self:buffer_add(((r == 1 or r == config.rows) and (c == 1 or c == config.cols)) and self.chars.corner or self.chars.field)
    end
    self:buffer_add("\n")
  end
  self:make_bookend(false)
  self:buffer_print()
end

function mesh:buffer_reset()
  self.buffer = ""
end

function mesh:make_bookend(with_title)
  if with_title then
    self:buffer_add("\n\n")
    local padding = (config.cols - 12) / 2 -- 12 chars in "Gilgamesh AI"
    for i = 1, padding / 2 do self:buffer_add(self.chars.decorative .. " ") end
    self:buffer_add("Gilgamesh AI")
    for i = 1, padding / 2 do self:buffer_add(" " .. self.chars.decorative) end
  end
  self:buffer_add("\n\n")
end

function mesh:buffer_add(s)
  self.buffer = self.buffer .. s
end

function mesh:buffer_print()
  print(self.buffer)
end

return mesh