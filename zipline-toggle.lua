local zipline_speed = Zipline_speed_low

if Zipline_speed_toggled then
    zipline_speed = Zipline_speed_high
end


function ZipLine:update(unit, t, dt)
    if not self._enabled then
        return
    end

    self._speed = zipline_speed
    
    self:_update_total_time()
    
    self:_update_sled(t, dt)
    self:_update_sounds(t, dt)
 
    if ZipLine.DEBUG then
        self:debug_draw(t, dt)
    end
end

Zipline_speed_toggled = not Zipline_speed_toggled
managers.chat:_receive_message(ChatManager.GAME, "[Ziplines]", "Speed set to " .. zipline_speed .. " cm/s", Color.green)