--=========== Copyright © 2018, Planimeter, All rights reserved. ===========--
--
-- Purpose: Progress Bar class
--
--==========================================================================--

class "gui.progressbar" ( "gui.panel" )

local progressbar = gui.progressbar

function progressbar:progressbar( parent, name )
	gui.panel.panel( self, parent, name )
	self.width    = love.window.toPixels( 216 )
	self.height   = love.window.toPixels( 2 )
	self.min      = 0
	self.max      = 1
	self.value    = 0

	self:setScheme( "Default" )
end

function progressbar:draw()
	self:drawBackground( "progressbar.backgroundColor" )
	self:drawForeground()

	gui.panel.draw( self )
end

function progressbar:drawForeground()
	local color   = "progressbar.foregroundColor"
	local value   = self:getValue()
	local min     = self:getMin()
	local max     = self:getMax()
	local percent = math.remap( value, min, max, 0, 1 )
	local width   = self:getWidth() * percent
	local height  = self:getHeight()
	love.graphics.setColor( self:getScheme( color ) )
	love.graphics.rectangle( "fill", 0, 0, width, height )
end

accessor( progressbar, "min" )
accessor( progressbar, "max" )
accessor( progressbar, "value" )

function progressbar:setMin( min )
	self.min = min
	self:invalidate()
end

function progressbar:setMax( max )
	self.max = max
	self:invalidate()
end

function progressbar:setValue( value )
	self.value = value
	self:invalidate()
end
