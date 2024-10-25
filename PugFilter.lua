local function print_color(msg)
   DEFAULT_CHAT_FRAME:AddMessage(msg, 0, 213, 255);
end


local function print(msg)
   DEFAULT_CHAT_FRAME:AddMessage(msg);
end


local function s(msg, substring)
   return string.find(msg, substring); 
end


local function default_keywords()
   return {"kara", "mc", "zg", "aq20", "ubrs", "ony"};
end


local function PugFilter_OnEvent()
   if event then
      local msg = arg1;
      local msg_lower = string.lower(arg1);
      
      if (toggle and event == "CHAT_MSG_CHANNEL" and s(arg4, "World") and s(msg_lower, "lf")) then
	 for k,v in keywords do
	    if (s(msg_lower, string.lower(v))) then
	       print_color("["..arg2.."]"..": "..msg);
	    end
	 end	 
      end
      
   end
end

 
local function SlashCommand(msg)
   local paramstr = msg;
   local cmd = paramstr;
   local index = strfind(cmd, " ");

   if (index) then
     cmd = strsub(cmd, 1, index-1);
     paramstr = strsub(paramstr, index+1);
   else
     paramstr = "";
   end
   if (not cmd) then
	return nil;
   end
   
   if (cmd == "") then
      print("Usage: /pugfilter <command> [args]");
      print("Available commands:");
      print("/pugfilter add <keyword> - add keyword");
      print("/pugfilter remove <keyword> - remove keyword");
      print("/pugfilter list - list current keywords");
      print("/pugfilter toggle - toggles PugFilter on/off");
      print("/pugfilter reset - resets all settings");
      print("/pugfilter status - displays current status of pugfilter");

   elseif (cmd == "add") then
      table.insert(keywords, paramstr);
      print("addded keyword "..paramstr.." to pugfilter");

   elseif (cmd == "remove") then
      new_keywords = {};
      for k,v in keywords do
        if (v ~= paramstr) then
	  table.insert(new_keywords, v); 
	end
      end
      keywords = new_keywords;

   elseif (cmd == "list") then
      print("pugfilter current keywords:")
      for k, v in keywords do
	 print(v);
      end
      
   elseif (cmd == "toggle") then
      if (toggle) then
	 toggle = false;
	 print("pugfilter disabled");
      else
	 toggle = true;
	 print("pugfilter enabled");
      end

   elseif (cmd == "reset") then
      keywords = default_keywords();           
      print("pugfilter keywords reset");

   elseif (cmd == "status") then
      print("pugfilter is "..(toggle and "enabled" or "disabled"));
      print("pugfilter current keywords:");
      for k, v in keywords do
	 print(v);
      end
      
  end
end


toggle = toggle or true;
keywords = keywords or default_keywords();

local f = CreateFrame("Frame", "PugFilterFrame");
f:RegisterEvent("CHAT_MSG_CHANNEL");
f:SetScript("OnEvent", PugFilter_OnEvent);

SLASH_PUGFILTER1 = "/pugfilter";
SlashCmdList["PUGFILTER"] = SlashCommand;
f:Hide();
