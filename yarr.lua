_addon.name = 'yarr'
_addon.author = 'Suteru'
_addon.version = '0.8'
_addon.language = 'English'

require('luau')
texts = require('texts')

-- Config

defaults = {}
defaults.display = {}
defaults.display.pos = {}
defaults.display.pos.x = 1500
defaults.display.pos.y = 20
defaults.display.bg = {}
defaults.display.bg.red = 0
defaults.display.bg.green = 0
defaults.display.bg.blue = 0
defaults.display.bg.alpha = 102
defaults.display.text = {}
defaults.display.text.font = 'Consolas'
defaults.display.text.red = 255
defaults.display.text.green = 255
defaults.display.text.blue = 255
defaults.display.text.alpha = 255
defaults.display.text.size = 12

settings = config.load(defaults)
settings:save()

text_box = texts.new(settings.display, settings)

-- Constructor

initialize = function(text, settings)
    local properties = L{}
    properties:append('${pirates}')
	text:clear()
    text:append(properties:concat('\n'))
end

text_box:register_event('reload', initialize)

-- Events

windower.register_event('zone change', 'load', function()
    local remove = S{}


		local zone = windower.ffxi.get_info().zone
        local info = {}
		local pirates = "test"
		info.zone = zone
		info.pirates = "test"
		
		if zone == 220 or zone == 221 then
			info.pirates = 'No pirates'
       			text_box:show()
			text_box:update(info)
		elseif zone == 227 or zone == 228 then
		
			info.pirates = "Pirates!!"
       			text_box:show()
		text_box:update(info)
		elseif zone == 252 then
			info.pirates = "Deep in the pirates' cove!"
			text_box:show()
			text_box:update(info)
		else
		info.pirates = "Not in Pirate Territory!"
			text_box:hide()
			text_box:update(info)
		end


end)

--[[
Copyright © 2018, Suteru
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name of Windower nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Windower BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
