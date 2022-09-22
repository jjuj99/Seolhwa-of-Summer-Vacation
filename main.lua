-----------------------------------------------------------------------------------------
--
-- main.lua   
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

--json parse--
local json = require "json"

function jsonParse( src )
	local filename = system.pathForFile( src )

	local data, pos, msg = json.decodeFile( filename )

	if ( data ) then
		return data
	else
		print("WARNING : " .. pos, msg)
		return nil
	end
end

-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "start" )
end

onFirstView()	-- invoke first tab button's onPress event manually
