fn = {}

function fn.dirty_screen(bool)
  if bool == nil then return globals.screen_dirty end
  globals.screen_dirty = bool
  return globals.screen_dirty
end

function rerun()
  norns.script.load(norns.state.script)
end

return fn