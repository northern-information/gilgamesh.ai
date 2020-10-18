mesh = {}

function mesh.init()
  mesh.buffer = ""
  mesh.rows = 16
  mesh.cols = 64
  mesh.chars = {
    corner = "+",
    field = ".",
    decorative = "-"
  }
end

--[[ 

  live coding commands

  these are designed to be terse and easy to type
  all use . methods instead of : so you don't have to use shift

]]

function mesh.f()
  mesh:buffer_reset()
  mesh:make_bookend(true)
  mesh:field()
  mesh:make_bookend(false)
  mesh:buffer_print()
end

function mesh:buffer_reset()
  self.buffer = ""
end

function mesh:make_bookend(with_title)
  if with_title then
    self:buffer_add("\n\n")
    local padding = (self.cols - 12) / 2 -- 12 chars in "Gilgamesh AI"
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

function mesh:field()
  for r = 1, self.rows do
    for c = 1, self.cols do
      self:buffer_add(((r == 1 or r == self.rows) and (c == 1 or c == self.cols)) and self.chars.corner or self.chars.field)
    end
    self:buffer_add("\n")
  end
end

return mesh