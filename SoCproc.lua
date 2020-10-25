local SoCproc = CreateFrame('frame', nil, UIParent)
  SoCproc:Hide()
  SoCproc:SetParent(nil)
  SoCproc:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  
  SoCproc:SetScript("OnEvent", function(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
      local _, eventType, sourceGUID, spellCaster, _, _, _, _, _, spellName = ...
      
    if ((eventType == "SPELL_DAMAGE" or eventType == "SPELL_MISSED") and spellName == "Seal of Command" and spellCaster == UnitName("player")) then
        PlaySound("RaidWarning", "master");end
    end
  end)
-- move errors to the right bottom corner
-- my resolution is 1920x1080
  UIErrorsFrame:ClearAllPoints()
  UIErrorsFrame:SetScale(0.9)
  UIErrorsFrame:SetPoint("CENTER", 875, -300)
  -- move buffs above my toon frame
  BUFFS_PER_ROW = 16
  TemporaryEnchantFrame:ClearAllPoints()
  TemporaryEnchantFrame:SetPoint("CENTER", -130, 430)
  TemporaryEnchantFrame.ClearAllPoints = function() end
  TemporaryEnchantFrame.SetPoint = function() end
  -- debug commands
  SLASH_SOCPROC1 = "/soc"
  SlashCmdList["SOCPROC"] = function(cmd) ChatCommand(cmd) end
  -- slash function
function ChatCommand(cmd)
	cmd = cmd:lower()
	if cmd == "show" then
    DEFAULT_CHAT_FRAME:AddMessage("Debug 1 /soc show")
    else 
    DEFAULT_CHAT_FRAME:AddMessage("Debug 2 /soc");
  end
end
