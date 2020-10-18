-- k1: exit  e1: ???
--
--      e2: ???    e3: ???
--
--    k2: ???     k3: ???

include("lib/includes")

function init()
  globals = {}
  globals.a = math.random(0, 100)
  globals.b = math.random(0, 100)
  globals.fps = 6
  api.init()
  graphics.init()
  mesh.init()
  globals.redraw_clock_id = clock.run(graphics.redraw_clock)
  globals.frame_clock_id = clock.run(graphics.frame_clock)
  globals.screen_dirty = true
  redraw()
end

function redraw()
  if not fn.dirty_screen() then return end
  graphics:render()
  fn.dirty_screen(false)
end

function enc(e, d)
  if e == 2 then
    globals.a = util.clamp(globals.a + d, 0, 100)
  elseif e == 3 then
    globals.b = util.clamp(globals.b + d, 0, 100)
  end
  fn.dirty_screen(true)
end

function key(k, z)
  fn.dirty_screen(true)
end

function cleanup()
  clock.cancel(globals.redraw_clock_id)
  clock.cancel(globals.frame_clock_id)
end