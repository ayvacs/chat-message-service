--[[

 ██████╗██╗  ██╗ █████╗ ████████╗    ███╗   ███╗███████╗███████╗███████╗ █████╗  ██████╗ ███████╗    ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗
██╔════╝██║  ██║██╔══██╗╚══██╔══╝    ████╗ ████║██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔════╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝
██║     ███████║███████║   ██║       ██╔████╔██║█████╗  ███████╗███████╗███████║██║  ███╗█████╗      ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  
██║     ██╔══██║██╔══██║   ██║       ██║╚██╔╝██║██╔══╝  ╚════██║╚════██║██╔══██║██║   ██║██╔══╝      ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  
╚██████╗██║  ██║██║  ██║   ██║       ██║ ╚═╝ ██║███████╗███████║███████║██║  ██║╚██████╔╝███████╗    ███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝

                CLIENT SCRIPT
        
        Provides simple and customizable APIs for the client and server to send messages to the specified client(s).
        For more information, read <https://github.com/ayvacs/chat-message-service>

        This code should be placed in a LocalScript parented to a ScreenGui with "ResetOnSpawn" disabled.

        Written by ayvacs <https://github.com/ayvacs>
        and licensed under the MIT License <https://raw.githubusercontent.com/ayvacs/chat-message-service/main/LICENSE>

]]


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local RBXSystem
local event = ReplicatedStorage.ChatMessageService.ClientMakeMessage

event.OnClientInvoke = function(text: string)
    repeat wait() until RBXSystem
    RBXSystem:DisplaySystemMessage(text)
end

RBXSystem = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")