--[[

 ██████╗██╗  ██╗ █████╗ ████████╗    ███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗    ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗
██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝
██║     ███████║███████║   ██║       ██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗      ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  
██║     ██╔══██║██╔══██║   ██║       ██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝      ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  
╚██████╗██║  ██║██║  ██║   ██║       ██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗    ███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝

                MODULE SCRIPT
        
        Provides simple and customizable APIs for the client and server to send messages to the specified client(s).
        For more information, read <https://github.com/ayvacs/chat-message-service>

        This code should be placed in a ModuleScript named "ChatMessageService" parented to ReplicatedStorage.
        Also, create a RemoteEvent named "ClientMakeMessage" parented to this script.

        Written by ayvacs <https://github.com/ayvacs>
        and licensed under the MIT License <https://raw.githubusercontent.com/ayvacs/chat-message-service/main/LICENSE>

]]


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