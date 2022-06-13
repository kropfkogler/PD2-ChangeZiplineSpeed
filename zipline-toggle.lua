function ZipLine:update(unit, t, dt)
    if not self._enabled then
        return
    end

    if Zipline_speed_toggled then
        self._speed = Zipline_speed_low
    else
        self._speed = Zipline_speed_high
    end
    
    self:_update_total_time()
    
    self:_update_sled(t, dt)
    self:_update_sounds(t, dt)
 
    if ZipLine.DEBUG then
        self:debug_draw(t, dt)
    end
end

Zipline_speed_toggled = not Zipline_speed_toggled