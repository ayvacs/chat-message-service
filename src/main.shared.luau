local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")


local ChatMessageService = {}
ChatMessageService.Client = {}
ChatMessageService.Server = {}


function getRBXSystemAsync()
    return TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")
end





function Client:CurrentClient(text: string)
    getRBXSystemAsync():DisplaySystemMessage(text)
end


function Server:SpecifiedClient(client: Player, text: string)
    getRBXSystemAsync()
    return script.ClientMakeMessage:InvokeClient(client, text)
end


function Server:SpecifiedClients(clients: table, text: string)
    getRBXSystemAsync()

    local results = {}
    for _, plr in pairs(clients) do
        results[plr.Name] = Server:SpecifiedClient(plr, text)
    end
    return results
end


function Server:AllClients(text: string)
    getRBXSystemAsync()
    return Server:SpecifiedClients(Players:GetPlayers(), text)
end



return ChatMessageService