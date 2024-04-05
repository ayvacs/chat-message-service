local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local RBXSystem
local event = ReplicatedStorage.ChatMessageService.ClientMakeMessage

event.OnClientInvoke = function(text: string)
    repeat wait() until RBXSystem
    RBXSystem:DisplaySystemMessage(text)
end

RBXSystem = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")