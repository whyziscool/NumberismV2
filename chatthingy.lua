repeat task.wait() until game:IsLoaded()
task.wait()

warn([[ minecraft chat loaded ty mistercoolertyper for the cool chat stuff ]])

game.StarterGui:SetCore( 
    "ChatMakeSystemMessage",  { 
        Text = [[
Prism

changelog:
cracked by piston

prism command system
.nameclient Prism
(renames the client text can be enabled via HUD Module)
        ]], 
        Color = Color3.fromRGB( 255,0,255 ), 
        Font = Enum.Font.Gotham, 
        FontSize = Enum.FontSize.Size24
    } 
)
 

function getremote(t)
    for i, v in pairs(t) do
        if v == "Client" then
            local tab = t[i + 1]
            return tab
        end
    end
    return ""
end

if getgenv().chatmod then
    for i,v in next, getgenv().chatmod.connections do
        v:Disconnect()
    end
end
getgenv().chatmod = {
    connections = {},
}
local lplr = game:GetService("Players").LocalPlayer

local Chat = lplr.PlayerGui.Chat
local ChatFrame = Chat.Frame
local resolution = workspace.CurrentCamera.ViewportSize
local Box = Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local uis = game:GetService("UserInputService")
local Size = UDim2.new(0,577,0,273)
local Position = UDim2.new(0,-7,0,resolution.y-300)
local shiftheld
local pressed

ChatFrame.Size = Size
ChatFrame.Position = Position
ChatFrame.ChatBarParentFrame.Visible = false
ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    resolution = workspace.CurrentCamera.ViewportSize
    if not pressed then
        Position = UDim2.new(0,-7,0,resolution.y-300)
        ChatFrame.Size = UDim2.new(0,577,0,273)
        ChatFrame.Position = Position
    end
end)

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = uis.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Slash and not uis:GetFocusedTextBox() then
        if not pressed then
            pressed = true
            ChatFrame.Position = UDim2.new(0,0,0,0)
            ChatFrame.Size = UDim2.new(0,resolution.x,0,resolution.y)
            ChatFrame.ChatBarParentFrame.Visible = true
            Box:CaptureFocus()
            task.wait()
            Box.Text = ""
        else
            if not uis:GetFocusedTextBox() then
                pressed = false
                ChatFrame.ChatBarParentFrame.Visible = false
                ChatFrame.Size = Size
                ChatFrame.Position = Position
            end
        end
    elseif key.KeyCode == Enum.KeyCode.Return then
        if pressed then
            pressed = false
            ChatFrame.ChatBarParentFrame.Visible = false
            ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false
            ChatFrame.Size = Size
            ChatFrame.Position = Position
        end
    end
end)

for i,v in next, getconnections(Box.FocusLost) do
	v:Disable()
end

local Utilities

if workspace:FindFirstChild("Map") then
	Utilities = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/Utilities.lua", true))()
end
	if string.find(command,".nameclient") then
		local newStr, replaced = string.gsub(Box.Text, ".nameclient ", "")
		getgenv().ClientName = newStr
		return
	end
        if Box.Text:find(";kick default") then
            newtext = ";kill default"
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
            task.wait(1)
        end
        newtext = table.concat(split, " ")
        if newtext ~= "" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
        end
        Box.Text = 'To Chat click here or press "/" key'
    else
        Box.Text = 'To Chat click here or press "/" key'
    end
end)
