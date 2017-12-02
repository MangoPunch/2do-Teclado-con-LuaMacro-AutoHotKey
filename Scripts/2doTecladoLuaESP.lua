-- Consigue luamacros aqui: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- Conecta tu 2do teclado, abrelo en LUAmacros,presiona el boton de "Play".
-- Despues, presiona cualquier tecla para asignar el nombre ('MACROS') al teclado secundario.
-- Lamentablemente tienes que hacer esto cada vez que abras luamacros para que funcione tu teclado secundario.
-- Debe haber una mejor solucion, pero aun no la hemos encontrado.
-- Escrito por Taran Van Hermet (Editor LTT), traduccion al ESP por MangoPunch (MP en adelante)
-- Comentario adicional: MP
-- Canal TARAN VAN HERMET: https://www.youtube.com/user/TaranVH
-- Tutorial de como usar esto en español aqui: 

lmc_assign_keyboard('MACROS'); -- Esto permite definir tu otro teclado como un input adicional que sera identificado como "MACROS".

-- a continuacion viene la funcion que te permitira usar LuaMacros junto a AHK (Auto Hot Key)

sendToAHK = function (key)   
      --print('It was assigned string:    ' .. key)
      local file = io.open("C:\\Users\\Tu-usario\\...\\teclaPresionada.txt", "w")
      -- Este es un ejemplo de directorio, deberas reemplazarlo por el tuyo donde se encuentre el documento de texto. MP
      -- Lo que esta haciendo es 'w' (write) las teclas que presionamos en el segundo teclado al documento "teclaPresionada.txt". MP
      -- Esta no es la solucion optima, pero funciona.
      -- Recuerda sustituir la ubicacion de tu archivo "teclaPresionada.txt" usando DOS BARRAS INVERSAS.
      -- NO OLVIDAR LA EXTENSION DEL ARCHIVO!!! MP

      --print("estamos dentro del archivo de texto") -- esto fue para verificar que funciona, dejalo desactivado MP
      
      file:write(key)
      file:flush() --"flush" significa "grabar"
      file:close()
      
      lmc_send_keys('{F24}')  -- Esto "presiona" F24.
      -- Usar la tecla F24 para activar AutoHotKey NO es el mejor metodo. Si encuentras una mejor solucion, no dudes en compartirla! 
end

-- MP: en mi teclado en español hay algo particular con las siguientes teclas:
-- inicio, insert, suprimir, fin, re pag, av pag
-- Al presionar cualquiera de estas sale su numero correspondiente.
-- Ej. Inicio figura como la tecla 36, pero tambien sale 255, asi que este valor
-- se debe dejar fuera del script el 255.
-- La tecla enter principal y la del numpad tienen el mismo valor (13).

local config = {
	[45]  = "insert",
	[36]  = "home",
	[33]  = "pageup",
	[46]  = "delete",
	[35]  = "end",
	[34]  = "pagedown",
	[27]  = "escape",
	[112] = "F1",
	[113] = "F2",
	[114] = "F3",
	[115] = "F4",
	[116] = "F5",
	[117] = "F6",
	[118] = "F7",
	[119] = "F8",
	[120] = "F9",
	[121] = "F10",
	[122] = "F11",
	[123] = "F12",
	[8]   = "backspace",
	[220] = "backslash", -- es en realidad el boton de "grado" a la izquierda del 1 (ps, es arriba de TAB). MP
	[13]  = "enter", -- la tecla enter principal y la del numpad son identificadas con el mismo numero. MP
	[16]  = "rShift",
	[17]  = "rCtrl",
	[38]  = "up",
	[37]  = "left",
	[40]  = "down",
	[39]  = "right",
	[32]  = "space",
	[186] = "semicolon",
	[222] = "singlequote",
	[190] = "period",
	[191] = "slash",
	[188] = "comma",
	[219] = "leftbracket",
	[221] = "rightbracket",
	[189] = "minus",
	[187] = "equals",
	[96]  = "num0",
	[97]  = "num1",
	[98]  = "num2",
	[99]  = "num3",
	[100] = "num4",
	[101] = "num5",
	[102] = "num6",
	[103] = "num7",
	[104] = "num8",
	[105] = "num9",

	[106] = "numMult",
    [107] = "numDelete",
    -- 108 is unknown...?
	[109] = "numMult",
    [110] = "numDelete",
	[111] = "numDiv",
    [144] = "numLock", -- Evitar usarla. Manten NumLock Encendido o podria tener efectos desconocidos.

    [192] = "`",  -- esta es la ñ/enie/ ya saben a que me prefiero...
                  -- Sin quejas, recuerden que nos estamos basando en codigo de un teclado ENG. MP
    [9]   = "tab",
    [20]  = "capslock",
    [18]  = "alt",


	[string.byte('Q')] = "q",
	[string.byte('W')] = "w",
	[string.byte('E')] = "e",
	[string.byte('R')] = "r",
	[string.byte('T')] = "t",
	[string.byte('Y')] = "y",
	[string.byte('U')] = "u",
	[string.byte('I')] = "i",
	[string.byte('O')] = "o",
	[string.byte('P')] = "p",
	[string.byte('A')] = "a",
	[string.byte('S')] = "s",
	[string.byte('D')] = "d",
	[string.byte('F')] = "f",
	[string.byte('G')] = "g",
	[string.byte('H')] = "h",
	[string.byte('J')] = "j",
	[string.byte('K')] = "k",
	[string.byte('L')] = "l",
	[string.byte('Z')] = "z",
	[string.byte('X')] = "x",
	[string.byte('C')] = "c",
	[string.byte('V')] = "v",
	[string.byte('B')] = "b",
	[string.byte('N')] = "n",
	[string.byte('M')] = "m",

    [string.byte('0')] = "0",
	[string.byte('1')] = "1",
	[string.byte('2')] = "2",
	[string.byte('3')] = "3",
	[string.byte('4')] = "4",
	[string.byte('5')] = "5",
    [string.byte('6')] = "6",
    [string.byte('7')] = "7",
    [string.byte('8')] = "8",
    [string.byte('9')] = "9",

	--[255] = "Imprimir Pantalla" -- como explique antes esta asignada
  -- a muchas cosas en simultaneo. No sirve.
}

-- define callback for whole device
lmc_set_handler('MACROS', function(button, direction)
	if (direction == 1) then return end  -- "ignore down." -- Temo que esto tiene el efecto de anular las teclas modificadoras, no es optimo. 

	if type(config[button]) == "string" then
                print(' ')
                print('Your key ID number is:   ' .. button)
				print('It was assigned string:    ' .. config[button])
				sendToAHK(config[button])
	else
                print(' ')
                print('Not yet assigned: ' .. button)
	end
end)            
