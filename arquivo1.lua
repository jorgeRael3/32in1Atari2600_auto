function apertaQuadrado()
  joypad.set({["P1 □"] = true})
end

function apertaTriangulo()
  joypad.set({["P1 △"] = true})
end

function apertaBola()
  joypad.set({["P1 ○"] = true})
end

function quadro_salvo()
  savestate.saveslot(2)
  savestate.loadslot(1)
  local num = emu.framecount()
  savestate.loadslot(2)
  return num
end

function esperar(frames)
  for i = 1, frames do
    emu.frameadvance()
  end
end

function pula_ate_quadro(quadro)
  esperar(quadro - emu.framecount())
end

function ciclo_final()
  local v0 = emu.framecount()
  while true do
    gui.text(100, 200, v0)
    emu.frameadvance()
  end  
end

function tiro(num)
  for i = 1, 26 do
    joypad.set({["P1 R1"] = true})
    emu.frameadvance()
  end
  for i = 1, 42 * num - 40 do
    joypad.set({["P1 R1"] = true, ["P1 X"] = true})
    emu.frameadvance()
  end
end

function andar(num)
  for i = 1, num do
    joypad.set({["P1 Up"] = true})
    emu.frameadvance()
  end
end

function correr(num)
  for i = 1, num do
    joypad.set({["P1 Up"] = true, ["P1 □"] = true})
    emu.frameadvance()
  end
end

function virar_esquerda(num)
  for i = 1, num do
    joypad.set({["P1 Left"] = true})
    emu.frameadvance()
  end
end

function virar_direita(num)
  for i = 1, num do
    joypad.set({["P1 Right"] = true})
    emu.frameadvance()
  end
end

function correr_virando_direita(num)
  for i = 1, num do
    joypad.set({["P1 Right"] = true, ["P1 Up"] = true, ["P1 □"] = true})
    emu.frameadvance()
  end
end

function correr_virando_esquerda(num)
  for i = 1, num do
    joypad.set({["P1 Left"] = true, ["P1 Up"] = true, ["P1 □"] = true})
    emu.frameadvance()
  end
end

savestate.loadslot(1)
if emu.framecount() <= 3426 then
  pula_ate_quadro(3426)
  joypad.set({["P1 Left"] = true, ["P1 X"] = true})
end
if emu.framecount() <= 3428 then
  pula_ate_quadro(3428)
  joypad.set({["P1 X"] = true})
end
if emu.framecount() <= 13945 then
  pula_ate_quadro(13945)
  correr(154)
  tiro(1)
  correr(129)
  joypad.set({["P1 X"] = true})
  esperar(1)
  correr(117)
  joypad.set({["P1 X"] = true})
end
--[[
Pegou em 20406
correr_virando_direita(61)
correr(15)
correr_virando_direita(48)
correr(166)
correr_virando_direita(50)
correr(21)
joypad.set({["P1 X"] = true})
Casos:
61, 15, 48, 166, 50, 21
61, 15, 49, 165, 50, 21
61, 15, 49, 164, 51, 21
61, 15, 49, 164, 52, 20
61, 15, 49, 164, 53, 19
61, 15, 49, 164, 54, 18
61, 15, 48, 165, 54, 18
]]
pula_ate_quadro(20044)
esperar(30)
--virar_esquerda(1)
---------------------------------------------------------------------
savestate.saveslot(3)
ciclo_final()