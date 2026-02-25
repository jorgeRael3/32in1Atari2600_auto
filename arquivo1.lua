--[[
	Responsabilidades da IA
	1) Determinar qual será o nome de cada função existente.
	2) Determinar a criação de nova função para remover duplicação de
	código existente.
	3) Determinar a criação novas funções para desmembrar uma
	função que tem múltiplas responsabilidades.

	O que a IA não deve fazer
	1) Gerar código.
	2) Escolher o nome para uma função que não foi implementada e nem
	remove duplicação de código.
]]

function ObterAssinaturaDoJogo(...)
	assert(#{...} == 0)
	local v0 = {15272, 59431, 34294, 9276, 42708, 6784, 53050, 17025,
	519, 4795, 255, 23339, 49404, 16896, 4896, 1349, 10901, 6328,
	15430, 0, 24640, 65279, 512, 8738, 52224, 257, 6144, 61664, 636,
	128, 6322, 7710}
	local v1 = memory.getcurrentmemorydomain()
	memory.usememorydomain("System Bus")
	local v2 = memory.read_u16_le(0xF784)
	memory.usememorydomain(v1)
	for v3 = 1, 32 do
		if v2 == v0[v3] then
			return v3
		end
	end
end

function AlternarBancoAteIndice(indice_jogo, ...)
	assert(#{...} == 0)
	assert(type(indice_jogo) == "number")
	assert(indice_jogo == math.floor(indice_jogo))
	assert(1 <= indice_jogo)
	assert(indice_jogo <= 32)
	client.reboot_core()
	if indice_jogo >= 2 then
		joypad.set({["Power"] = true})
	end
	for v0 = 1, indice_jogo - 2 do
		emu.frameadvance()
		joypad.set({["Power"] = true})
	end
end

function ValidarMapeamentoDosJogos(...)
	assert(#{...} == 0)
	for v0 = 1, 32 do
		AlternarBancoAteIndice(v0)
		if v0 >= 2 then
			emu.frameadvance()
		end
		assert(ObterAssinaturaDoJogo() == v0)
	end
	console.log("Tudo certo.")
end

function nome()
	local v0 = ObterAssinaturaDoJogo()
	local v1 = {}
	v1[1] = "Human Cannonball"
	v1[2] = "Fun with Numbers"
	v1[3] = "3-D Tic-Tac-Toe"
	v1[4] = "Flag Capture"
	v1[5] = "Othello"
	v1[6] = "Golf"
	v1[7] = ""
end

while true do
	emu.frameadvance()
end
