local SoCproc = CreateFrame("Frame", "SoCproc", UIParent)
SoCproc:SetPoint("CENTER")
SoCproc:SetWidth(1)
SoCproc:SetHeight(1)
SoCproc:SetClampedToScreen(true)
SoCproc:SetMovable(true)

SoCproc:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
SoCproc:RegisterEvent("ADDON_LOADED")

SLASH_SoCproc1 = "/soc"
SlashCmdList["SoCproc"] = function(cmd) SoCproc:ChatCommand(cmd) end

SoCproc:SetScript("OnEvent", function(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
      local _, eventType, sourceGUID, spellCaster, _, _, _, _, _, spellName = ...
      
    if ((eventType == "SPELL_DAMAGE" or eventType == "SPELL_MISSED") and spellName == "Seal of Command" and spellCaster == UnitName("player")) then
        PlaySound("RaidWarning", "master");end
    end
  end)



function SoCproc:ChatCommand(cmd)
	cmd = cmd:lower()
	if cmd == "show" then
  DEFAULT_CHAT_FRAME:AddMessage("Debug 1")
else 
  DEFAULT_CHAT_FRAME:AddMessage("Debug 2");
end
end
