-- [[ JEAN_IOS // Script Hub COMPLETO ]]
-- jean x jay | discord: jean14_17
-- VERSIÓN FUNCIONAL CON INSTANT INTERACT

local Players      = game:GetService("Players")
local L_Plr        = Players.LocalPlayer
local RunService   = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS          = game:GetService("UserInputService")
local Camera       = workspace.CurrentCamera
local Mouse        = L_Plr:GetMouse()

_G.Hitbox_Size   = 15
_G.Parts_Active  = { UpperTorso = false, HumanoidRootPart = false, LeftUpperArm = false, RightUpperArm = false, LeftUpperLeg = false, RightUpperLeg = false }
_G.Visuals       = { Box = false, Names = false, Dist = false, Weapon = false, HealthBar = false, Tracers = false }
_G.Misc          = { Speed_On = false, SpeedVal = 16, FullBright = false, FlyMoto = false, FlyMotoSpeed = 50, FlyUp = false, FlyDown = false, FlyChar = false, FlyCharSpeed = 19, InstantInteract = false, InteractRange = 25 }

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JEAN_IOS"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui")

-- ════════ MAIN HUB ════════
local MF = Instance.new("Frame", ScreenGui)
MF.Size = UDim2.new(0, 590, 0, 450)
MF.Position = UDim2.new(0.5, -295, 0.5, -225)
MF.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
MF.Active = true; MF.Draggable = true; MF.Visible = true; MF.BorderSizePixel = 0
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 12)

local TB = Instance.new("Frame", MF); TB.Size = UDim2.new(1,0,0,56); TB.BackgroundColor3=Color3.fromRGB(14,14,22); TB.BorderSizePixel=0; Instance.new("UICorner",TB).CornerRadius=UDim.new(0,12)
local HT = Instance.new("TextLabel", TB); HT.Size=UDim2.new(1,-50,0,28); HT.Position=UDim2.new(0,16,0,7); HT.BackgroundTransparency=1; HT.Text="JEAN_IOS // Script Hub"; HT.TextColor3=Color3.new(1,1,1); HT.Font=Enum.Font.GothamBold; HT.TextSize=16; HT.TextXAlignment=Enum.TextXAlignment.Left
local HS = Instance.new("TextLabel", TB); HS.Size=UDim2.new(1,-50,0,18); HS.Position=UDim2.new(0,16,0,33); HS.BackgroundTransparency=1; HS.Text="jean14_17"; HS.TextColor3=Color3.fromRGB(52,199,89); HS.Font=Enum.Font.Gotham; HS.TextSize=12; HS.TextXAlignment=Enum.TextXAlignment.Left
local MinB = Instance.new("TextButton", TB); MinB.Size=UDim2.new(0,26,0,26); MinB.Position=UDim2.new(1,-34,0,15); MinB.Text="−"; MinB.BackgroundColor3=Color3.fromRGB(50,50,65); MinB.TextColor3=Color3.new(1,1,1); MinB.Font=Enum.Font.GothamBold; MinB.TextSize=16; MinB.BorderSizePixel=0; Instance.new("UICorner",MinB).CornerRadius=UDim.new(0,6)

local MB = Instance.new("Frame", ScreenGui); MB.Size=UDim2.new(0,220,0,36); MB.Position=UDim2.new(0.5,-110,0,8); MB.BackgroundColor3=Color3.fromRGB(10,10,14); MB.Visible=false; MB.Active=true; MB.Draggable=true; MB.BorderSizePixel=0; Instance.new("UICorner",MB).CornerRadius=UDim.new(0,10)
local MBS = Instance.new("UIStroke",MB); MBS.Color=Color3.fromRGB(52,199,89); MBS.Thickness=1.2
local ML = Instance.new("TextLabel",MB); ML.Size=UDim2.new(1,-38,1,0); ML.Position=UDim2.new(0,12,0,0); ML.BackgroundTransparency=1; ML.Text="JEAN_IOS"; ML.TextColor3=Color3.fromRGB(52,199,89); ML.Font=Enum.Font.GothamBold; ML.TextSize=14; ML.TextXAlignment=Enum.TextXAlignment.Left
local MaxB = Instance.new("TextButton",MB); MaxB.Size=UDim2.new(0,26,0,26); MaxB.Position=UDim2.new(1,-32,0.5,-13); MaxB.Text="+"; MaxB.BackgroundColor3=Color3.fromRGB(52,199,89); MaxB.TextColor3=Color3.fromRGB(0,0,0); MaxB.Font=Enum.Font.GothamBold; MaxB.TextSize=16; MaxB.BorderSizePixel=0; Instance.new("UICorner",MaxB).CornerRadius=UDim.new(0,6)
MinB.MouseButton1Click:Connect(function() MF.Visible=false; MB.Visible=true end)
MaxB.MouseButton1Click:Connect(function() MF.Visible=true; MB.Visible=false end)

local SB = Instance.new("Frame", MF); SB.Size=UDim2.new(0,128,1,-86); SB.Position=UDim2.new(0,8,0,58); SB.BackgroundTransparency=1; SB.BorderSizePixel=0
local SBL = Instance.new("UIListLayout",SB); SBL.Padding=UDim.new(0,5)
local SBP = Instance.new("UIPadding",SB); SBP.PaddingTop=UDim.new(0,4)

local CBG = Instance.new("Frame", MF); CBG.Size=UDim2.new(1,-148,1,-86); CBG.Position=UDim2.new(0,142,0,58); CBG.BackgroundColor3=Color3.fromRGB(14,14,22); CBG.BorderSizePixel=0; Instance.new("UICorner",CBG).CornerRadius=UDim.new(0,10)

local Tabs, TabBtns = {}, {}
local function MkTab(n)
    local sc = Instance.new("ScrollingFrame",CBG)
    sc.Size=UDim2.new(1,-8,1,-8); sc.Position=UDim2.new(0,4,0,4)
    sc.BackgroundTransparency=1; sc.BorderSizePixel=0; sc.ScrollBarThickness=3
    sc.ScrollBarImageColor3=Color3.fromRGB(52,199,89)
    sc.AutomaticCanvasSize=Enum.AutomaticSize.Y; sc.CanvasSize=UDim2.new(0,0,0,0); sc.Visible=false
    local ly = Instance.new("UIListLayout",sc); ly.Padding=UDim.new(0,6)
    local pd = Instance.new("UIPadding",sc); pd.PaddingTop=UDim.new(0,4); pd.PaddingBottom=UDim.new(0,8); pd.PaddingRight=UDim.new(0,4)
    Tabs[n]=sc; return sc
end
local CT=MkTab("Combat"); local VT=MkTab("Visuals"); local FT=MkTab("Farm"); local MT=MkTab("Misc"); local TT=MkTab("Teleport")

local function SetTab(n)
    for k,t in pairs(Tabs) do t.Visible=(k==n) end
    for k,b in pairs(TabBtns) do
        b.BackgroundColor3 = k==n and Color3.fromRGB(52,199,89) or Color3.fromRGB(20,20,30)
        b.TextColor3 = k==n and Color3.fromRGB(0,0,0) or Color3.fromRGB(150,150,160)
    end
end
local function MkTabBtn(lbl, n)
    local b=Instance.new("TextButton",SB); b.Size=UDim2.new(1,0,0,42); b.BackgroundColor3=Color3.fromRGB(20,20,30); b.TextColor3=Color3.fromRGB(150,150,160); b.Text=lbl; b.Font=Enum.Font.GothamBold; b.TextSize=12; b.BorderSizePixel=0; Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    b.MouseButton1Click:Connect(function() SetTab(n) end); TabBtns[n]=b
end
MkTabBtn("⚔️ Combat","Combat"); MkTabBtn("👁️ Visuals","Visuals"); MkTabBtn("🚜 Farm","Farm"); MkTabBtn("⚙️ Misc","Misc"); MkTabBtn("🧭 Teleport","Teleport")

-- UI HELPERS
local function IosRow(par, title, desc, init, cb)
    local row=Instance.new("Frame",par); row.Size=UDim2.new(1,0,0,62); row.BackgroundColor3=Color3.fromRGB(18,18,26); row.BorderSizePixel=0; Instance.new("UICorner",row).CornerRadius=UDim.new(0,10)
    local tl=Instance.new("TextLabel",row); tl.Size=UDim2.new(1,-72,0,26); tl.Position=UDim2.new(0,14,0,8); tl.BackgroundTransparency=1; tl.Text=title; tl.TextColor3=Color3.new(1,1,1); tl.Font=Enum.Font.GothamBold; tl.TextSize=13; tl.TextXAlignment=Enum.TextXAlignment.Left
    local sl=Instance.new("TextLabel",row); sl.Size=UDim2.new(1,-72,0,18); sl.Position=UDim2.new(0,14,0,36); sl.BackgroundTransparency=1; sl.Text=desc; sl.TextColor3=Color3.fromRGB(85,85,100); sl.Font=Enum.Font.Gotham; sl.TextSize=11; sl.TextXAlignment=Enum.TextXAlignment.Left
    local pill=Instance.new("Frame",row); pill.Size=UDim2.new(0,46,0,28); pill.Position=UDim2.new(1,-58,0.5,-14); pill.BackgroundColor3=init and Color3.fromRGB(52,199,89) or Color3.fromRGB(48,48,62); pill.BorderSizePixel=0; Instance.new("UICorner",pill).CornerRadius=UDim.new(1,0)
    local kn=Instance.new("Frame",pill); kn.Size=UDim2.new(0,22,0,22); kn.Position=init and UDim2.new(1,-25,0.5,-11) or UDim2.new(0,3,0.5,-11); kn.BackgroundColor3=Color3.new(1,1,1); kn.BorderSizePixel=0; Instance.new("UICorner",kn).CornerRadius=UDim.new(1,0)
    local st=init or false
    local btn=Instance.new("TextButton",row); btn.Size=UDim2.new(1,0,1,0); btn.BackgroundTransparency=1; btn.Text=""
    btn.MouseButton1Click:Connect(function()
        st=not st
        TweenService:Create(pill,TweenInfo.new(0.14),{BackgroundColor3=st and Color3.fromRGB(52,199,89) or Color3.fromRGB(48,48,62)}):Play()
        TweenService:Create(kn,TweenInfo.new(0.14),{Position=st and UDim2.new(1,-25,0.5,-11) or UDim2.new(0,3,0.5,-11)}):Play()
        if cb then cb(st) end
    end)
end

local function ValRow(par, title, desc, def, cb)
    local row=Instance.new("Frame",par); row.Size=UDim2.new(1,0,0,62); row.BackgroundColor3=Color3.fromRGB(18,18,26); row.BorderSizePixel=0; Instance.new("UICorner",row).CornerRadius=UDim.new(0,10)
    local tl=Instance.new("TextLabel",row); tl.Size=UDim2.new(1,-80,0,26); tl.Position=UDim2.new(0,14,0,8); tl.BackgroundTransparency=1; tl.Text=title; tl.TextColor3=Color3.new(1,1,1); tl.Font=Enum.Font.GothamBold; tl.TextSize=13; tl.TextXAlignment=Enum.TextXAlignment.Left
    local sl=Instance.new("TextLabel",row); sl.Size=UDim2.new(1,-80,0,18); sl.Position=UDim2.new(0,14,0,36); sl.BackgroundTransparency=1; sl.Text=desc; sl.TextColor3=Color3.fromRGB(85,85,100); sl.Font=Enum.Font.Gotham; sl.TextSize=11; sl.TextXAlignment=Enum.TextXAlignment.Left
    local inp=Instance.new("TextBox",row); inp.Size=UDim2.new(0,58,0,32); inp.Position=UDim2.new(1,-66,0.5,-16); inp.Text=tostring(def); inp.BackgroundColor3=Color3.fromRGB(26,26,38); inp.TextColor3=Color3.new(1,1,1); inp.Font=Enum.Font.GothamBold; inp.TextSize=14; inp.BorderSizePixel=0; Instance.new("UICorner",inp).CornerRadius=UDim.new(0,7)
    inp.FocusLost:Connect(function() local v=tonumber(inp.Text) or def; inp.Text=tostring(v); if cb then cb(v) end end)
end

local function SliderRow(par, title, desc, minV, maxV, def, cb)
    local row=Instance.new("Frame",par); row.Size=UDim2.new(1,0,0,74); row.BackgroundColor3=Color3.fromRGB(18,18,26); row.BorderSizePixel=0; Instance.new("UICorner",row).CornerRadius=UDim.new(0,10)
    local tl=Instance.new("TextLabel",row); tl.Size=UDim2.new(1,-80,0,22); tl.Position=UDim2.new(0,14,0,7); tl.BackgroundTransparency=1; tl.Text=title; tl.TextColor3=Color3.new(1,1,1); tl.Font=Enum.Font.GothamBold; tl.TextSize=13; tl.TextXAlignment=Enum.TextXAlignment.Left
    local sl=Instance.new("TextLabel",row); sl.Size=UDim2.new(1,-80,0,16); sl.Position=UDim2.new(0,14,0,26); sl.BackgroundTransparency=1; sl.Text=desc; sl.TextColor3=Color3.fromRGB(85,85,100); sl.Font=Enum.Font.Gotham; sl.TextSize=11; sl.TextXAlignment=Enum.TextXAlignment.Left
    local vl=Instance.new("TextLabel",row); vl.Size=UDim2.new(0,50,0,22); vl.Position=UDim2.new(1,-60,0,7); vl.BackgroundTransparency=1; vl.Text=tostring(def); vl.TextColor3=Color3.fromRGB(52,199,89); vl.Font=Enum.Font.GothamBold; vl.TextSize=14; vl.TextXAlignment=Enum.TextXAlignment.Right
    local track=Instance.new("Frame",row); track.Size=UDim2.new(1,-28,0,6); track.Position=UDim2.new(0,14,0,54); track.BackgroundColor3=Color3.fromRGB(40,40,54); track.BorderSizePixel=0; Instance.new("UICorner",track).CornerRadius=UDim.new(1,0)
    local fill=Instance.new("Frame",track); fill.Size=UDim2.new((def-minV)/(maxV-minV),0,1,0); fill.BackgroundColor3=Color3.fromRGB(52,199,89); fill.BorderSizePixel=0; Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)
    local knob=Instance.new("Frame",track); knob.Size=UDim2.new(0,18,0,18); knob.Position=UDim2.new((def-minV)/(maxV-minV),-9,0.5,-9); knob.BackgroundColor3=Color3.new(1,1,1); knob.BorderSizePixel=0; knob.ZIndex=2; Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)
    local hit=Instance.new("TextButton",row); hit.Size=UDim2.new(1,-20,0,34); hit.Position=UDim2.new(0,10,0,40); hit.BackgroundTransparency=1; hit.Text=""
    local dragging=false
    local function SetFromX(x)
        local rel=math.clamp((x-track.AbsolutePosition.X)/math.max(track.AbsoluteSize.X,1),0,1)
        local v=math.floor(minV+(maxV-minV)*rel+0.5)
        fill.Size=UDim2.new(rel,0,1,0); knob.Position=UDim2.new(rel,-9,0.5,-9); vl.Text=tostring(v)
        if cb then cb(v) end
    end
    hit.InputBegan:Connect(function(io)
        if io.UserInputType==Enum.UserInputType.MouseButton1 or io.UserInputType==Enum.UserInputType.Touch then
            dragging=true; SetFromX(io.Position.X)
        end
    end)
    UIS.InputChanged:Connect(function(io)
        if dragging and (io.UserInputType==Enum.UserInputType.MouseMovement or io.UserInputType==Enum.UserInputType.Touch) then
            SetFromX(io.Position.X)
        end
    end)
    UIS.InputEnded:Connect(function(io)
        if io.UserInputType==Enum.UserInputType.MouseButton1 or io.UserInputType==Enum.UserInputType.Touch then
            dragging=false
        end
    end)
end

local function ActBtn(par, lbl, col, cb)
    local b=Instance.new("TextButton",par); b.Size=UDim2.new(1,0,0,46); b.BackgroundColor3=col or Color3.fromRGB(52,199,89); b.TextColor3=col and Color3.new(1,1,1) or Color3.fromRGB(0,0,0); b.Text=lbl; b.Font=Enum.Font.GothamBold; b.TextSize=13; b.BorderSizePixel=0; Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
    b.MouseButton1Click:Connect(cb)
    return b
end

local function SecLbl(par, txt)
    local l=Instance.new("TextLabel",par); l.Size=UDim2.new(1,0,0,22); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=Color3.fromRGB(52,199,89); l.Font=Enum.Font.GothamBold; l.TextSize=11; l.TextXAlignment=Enum.TextXAlignment.Left
    return l
end

-- TABS CONTENT
SecLbl(CT,"  COMBAT")
ValRow(CT,"Tamaño Hitbox","Tamaño del hitbox",15,function(v) _G.Hitbox_Size=v end)
SecLbl(CT,"  HITBOX PARTS")
IosRow(CT,"Hitbox Torso","Hitbox en el torso",false,function(v) _G.Parts_Active.UpperTorso=v end)
IosRow(CT,"Hitbox HRP","Hitbox en HRP",false,function(v) _G.Parts_Active.HumanoidRootPart=v end)
IosRow(CT,"Brazo Izq.","Hitbox brazo izq.",false,function(v) _G.Parts_Active.LeftUpperArm=v end)
IosRow(CT,"Brazo Der.","Hitbox brazo der.",false,function(v) _G.Parts_Active.RightUpperArm=v end)
IosRow(CT,"Pierna Izq.","Hitbox pierna izq.",false,function(v) _G.Parts_Active.LeftUpperLeg=v end)
IosRow(CT,"Pierna Der.","Hitbox pierna der.",false,function(v) _G.Parts_Active.RightUpperLeg=v end)

SecLbl(VT,"  ESP")
IosRow(VT,"Box ESP","Caja alrededor de jugadores",false,function(v) _G.Visuals.Box=v end)
IosRow(VT,"Names","Nombre sobre jugadores",false,function(v) _G.Visuals.Names=v end)
IosRow(VT,"Distance","Distancia al jugador",false,function(v) _G.Visuals.Dist=v end)
IosRow(VT,"Weapon ESP","Arma del jugador",false,function(v) _G.Visuals.Weapon=v end)
IosRow(VT,"Health Bar","Barra de vida",false,function(v) _G.Visuals.HealthBar=v end)
IosRow(VT,"Tracers","Líneas hacia jugadores",false,function(v) _G.Visuals.Tracers=v end)

SecLbl(FT,"  AUTO FARM")
ActBtn(FT,"🚜 AUTO FARM",Color3.fromRGB(52,199,89),function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/rexxymayor-ai/SCRIPTtt/refs/heads/main/script%20automs",true))() end)
end)

SecLbl(MT,"  MOVIMIENTO")
IosRow(MT,"Speed Hack","Aumenta tu velocidad",false,function(v) _G.Misc.Speed_On=v end)
ValRow(MT,"Velocidad","Valor máx. 23",16,function(v) _G.Misc.SpeedVal=math.min(v,23) end)
IosRow(MT,"Full Bright","Ilumina el mapa",false,function(v) _G.Misc.FullBright=v end)
SecLbl(MT,"  INSTANT INTERACT")
IosRow(MT,"Instant Interact","Interactúa automático",false,function(v) _G.Misc.InstantInteract=v end)
SliderRow(MT,"Rango Interact","5-50 studs",5,50,25,function(v) _G.Misc.InteractRange=v end)

local Spectating=nil
local function StopSpectate()
    Spectating=nil
    local char=L_Plr.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    if hum then Camera.CameraSubject=hum end
end
local function SpectatePlayer(target)
    local tchar=target.Character
    local thum=tchar and tchar:FindFirstChildOfClass("Humanoid")
    if thum then Camera.CameraSubject=thum; Spectating=target end
end

SecLbl(TT,"  ESPECTEAR")
ActBtn(TT,"⏹️ Dejar de Espectear",Color3.fromRGB(180,40,40),function() StopSpectate() end)

local SpecListFrame=Instance.new("Frame",TT)
SpecListFrame.Size=UDim2.new(1,0,0,0); SpecListFrame.AutomaticSize=Enum.AutomaticSize.Y
SpecListFrame.BackgroundTransparency=1
local slLy=Instance.new("UIListLayout",SpecListFrame); slLy.Padding=UDim.new(0,6)

SecLbl(TT,"  TP JUGADORES")
local PlrListFrame=Instance.new("Frame",TT)
PlrListFrame.Size=UDim2.new(1,0,0,0); PlrListFrame.AutomaticSize=Enum.AutomaticSize.Y
PlrListFrame.BackgroundTransparency=1
local plLy=Instance.new("UIListLayout",PlrListFrame); plLy.Padding=UDim.new(0,6)

local function RebuildPlrList()
    for _,c in pairs(SpecListFrame:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    for _,c in pairs(PlrListFrame:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    for _,p in pairs(Players:GetPlayers()) do
        if p~=L_Plr then
            local srow=Instance.new("Frame",SpecListFrame)
            srow.Size=UDim2.new(1,0,0,48); srow.BackgroundColor3=Color3.fromRGB(18,18,26); srow.BorderSizePixel=0
            Instance.new("UICorner",srow).CornerRadius=UDim.new(0,10)
            local snm=Instance.new("TextLabel",srow)
            snm.Size=UDim2.new(1,-116,1,0); snm.Position=UDim2.new(0,14,0,0); snm.BackgroundTransparency=1
            snm.Text=p.DisplayName.." (@"..p.Name..")"; snm.TextColor3=Color3.new(1,1,1)
            snm.Font=Enum.Font.GothamBold; snm.TextSize=12; snm.TextXAlignment=Enum.TextXAlignment.Left; snm.TextTruncate=Enum.TextTruncate.AtEnd
            local sp=Instance.new("TextButton",srow)
            sp.Size=UDim2.new(0,96,0,32); sp.Position=UDim2.new(1,-104,0.5,-16)
            sp.BackgroundColor3=Color3.fromRGB(90,60,200); sp.TextColor3=Color3.new(1,1,1)
            sp.Text="👁️ Espectear"; sp.Font=Enum.Font.GothamBold; sp.TextSize=12; sp.BorderSizePixel=0
            Instance.new("UICorner",sp).CornerRadius=UDim.new(0,8)
            sp.MouseButton1Click:Connect(function() SpectatePlayer(p) end)
            
            local trow=Instance.new("Frame",PlrListFrame)
            trow.Size=UDim2.new(1,0,0,48); trow.BackgroundColor3=Color3.fromRGB(18,18,26); trow.BorderSizePixel=0
            Instance.new("UICorner",trow).CornerRadius=UDim.new(0,10)
            local tnm=Instance.new("TextLabel",trow)
            tnm.Size=UDim2.new(1,-80,1,0); tnm.Position=UDim2.new(0,14,0,0); tnm.BackgroundTransparency=1
            tnm.Text=p.DisplayName.." (@"..p.Name..")"; tnm.TextColor3=Color3.new(1,1,1)
            tnm.Font=Enum.Font.GothamBold; tnm.TextSize=12; tnm.TextXAlignment=Enum.TextXAlignment.Left; tnm.TextTruncate=Enum.TextTruncate.AtEnd
            local tp=Instance.new("TextButton",trow)
            tp.Size=UDim2.new(0,60,0,32); tp.Position=UDim2.new(1,-68,0.5,-16)
            tp.BackgroundColor3=Color3.fromRGB(52,199,89); tp.TextColor3=Color3.new(0,0,0)
            tp.Text="TP"; tp.Font=Enum.Font.GothamBold; tp.TextSize=12; tp.BorderSizePixel=0
            Instance.new("UICorner",tp).CornerRadius=UDim.new(0,8)
            tp.MouseButton1Click:Connect(function()
                local tchar=p.Character
                local thrp=tchar and tchar:FindFirstChild("HumanoidRootPart")
                local char=L_Plr.Character
                local hrp=char and char:FindFirstChild("HumanoidRootPart")
                local hum=char and char:FindFirstChildOfClass("Humanoid")
                if thrp and hrp and hum and hum.SeatPart then
                    local dest=thrp.CFrame*CFrame.new(0,0,5)
                    local seat=hum.SeatPart
                    local model=seat:FindFirstAncestorOfClass("Model")
                    if model then
                        pcall(function() model:PivotTo(dest*CFrame.new(0,3,0)) end)
                    else
                        seat.CFrame=dest*CFrame.new(0,3,0)
                    end
                end
            end)
        end
    end
end
RebuildPlrList()
Players.PlayerAdded:Connect(function() task.wait(0.5) RebuildPlrList() end)
Players.PlayerRemoving:Connect(function(p) if Spectating==p then StopSpectate() end; task.wait(0.5) RebuildPlrList() end)

-- MAIN LOOP
local function CreateESP(plr)
    local Box=Drawing.new("Square"); Box.Thickness=1; Box.Filled=false; Box.Color=Color3.fromRGB(52,199,89); Box.Visible=false
    local Nm=Drawing.new("Text"); Nm.Size=13; Nm.Center=true; Nm.Outline=true; Nm.Color=Color3.new(1,1,1); Nm.Visible=false
    local Ds=Drawing.new("Text"); Ds.Size=13; Ds.Center=true; Ds.Outline=true; Ds.Color=Color3.new(1,1,1); Ds.Visible=false
    local Wp=Drawing.new("Text"); Wp.Size=13; Wp.Center=true; Wp.Outline=true; Wp.Color=Color3.fromRGB(52,199,89); Wp.Visible=false
    local Ln=Drawing.new("Line"); Ln.Thickness=1; Ln.Color=Color3.fromRGB(52,199,89); Ln.Visible=false
    local HB=Drawing.new("Square"); HB.Thickness=1; HB.Filled=true; HB.Visible=false
    RunService.RenderStepped:Connect(function()
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr~=L_Plr then
            local HRP=plr.Character.HumanoidRootPart; local Hum=plr.Character.Humanoid
            local Pos,OnScr=Camera:WorldToViewportPoint(HRP.Position)
            if OnScr then
                local S=Camera:WorldToViewportPoint(HRP.Position-Vector3.new(0,3,0)).Y-Camera:WorldToViewportPoint(HRP.Position+Vector3.new(0,2.6,0)).Y
                local BS=Vector2.new(S/1.5,S); local BP=Vector2.new(Pos.X-BS.X/2,Pos.Y-BS.Y/2)
                Box.Visible=_G.Visuals.Box; Box.Size=BS; Box.Position=BP
                Nm.Visible=_G.Visuals.Names; Nm.Text=plr.Name; Nm.Position=Vector2.new(Pos.X,BP.Y-15)
                local myH=L_Plr.Character and L_Plr.Character:FindFirstChild("HumanoidRootPart")
                Ds.Visible=_G.Visuals.Dist; Ds.Text="["..((myH and math.floor((myH.Position-HRP.Position).Magnitude)) or 0).."m]"; Ds.Position=Vector2.new(Pos.X,BP.Y+BS.Y+5)
                local t=plr.Character:FindFirstChildOfClass("Tool"); Wp.Visible=_G.Visuals.Weapon; Wp.Text=t and t.Name or "Hands"; Wp.Position=Vector2.new(Pos.X,BP.Y+BS.Y+18)
                Ln.Visible=_G.Visuals.Tracers; Ln.From=Vector2.new(Camera.ViewportSize.X/2,0); Ln.To=Vector2.new(Pos.X,BP.Y)
                HB.Visible=_G.Visuals.HealthBar; HB.Size=Vector2.new(2,(Hum.Health/Hum.MaxHealth)*BS.Y); HB.Position=Vector2.new(BP.X-5,BP.Y+(BS.Y-HB.Size.Y)); HB.Color=Color3.fromHSV(Hum.Health/Hum.MaxHealth*0.3,1,1)
            else Box.Visible=false;Nm.Visible=false;Ds.Visible=false;Wp.Visible=false;Ln.Visible=false;HB.Visible=false end
        else Box.Visible=false;Nm.Visible=false;Ds.Visible=false;Wp.Visible=false;Ln.Visible=false;HB.Visible=false end
    end)
end
for _,p in pairs(Players:GetPlayers()) do if p~=L_Plr then CreateESP(p) end end
Players.PlayerAdded:Connect(CreateESP)

RunService.Heartbeat:Connect(function()
    if _G.Misc.Speed_On and L_Plr.Character and L_Plr.Character:FindFirstChild("Humanoid") then
        L_Plr.Character.Humanoid.WalkSpeed=math.min(_G.Misc.SpeedVal,23)
    end
    if _G.Misc.FullBright then
        game:GetService("Lighting").Brightness=10
        game:GetService("Lighting").ClockTime=14
    end
    
    -- INSTANT INTERACT
    if _G.Misc.InstantInteract then
        local char=L_Plr.Character
        if char then
            local hrp=char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local range=_G.Misc.InteractRange
                for _,part in pairs(workspace:FindPartBoundsInRadius(hrp.Position,range)) do
                    if part:IsA("BasePart") then
                        local cd=part:FindFirstChild("ClickDetector")
                        if cd then
                            pcall(function() cd:FireServer() end)
                        end
                    end
                end
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then
                        local parent=obj.Parent
                        if parent then
                            local targetPos
                            if parent:FindFirstChild("HumanoidRootPart") then
                                targetPos=parent:FindFirstChild("HumanoidRootPart").Position
                            elseif parent:IsA("BasePart") then
                                targetPos=parent.Position
                            else
                                continue
                            end
                            if targetPos and (hrp.Position-targetPos).Magnitude<=range then
                                pcall(function() obj:InputHolding(Vector3.new()) end)
                            end
                        end
                    end
                end
            end
        end
    end
    
    for _,p in pairs(Players:GetPlayers()) do
        if p~=L_Plr and p.Character then
            for n,act in pairs(_G.Parts_Active) do
                if act then
                    local part=p.Character:FindFirstChild(n)
                    if part and part:IsA("BasePart") then
                        part.Size=Vector3.new(_G.Hitbox_Size,_G.Hitbox_Size,_G.Hitbox_Size)
                        part.CanCollide=false; part.Massless=true; part.Transparency=1
                    end
                end
            end
        end
    end
end)

print("✓ JEAN_IOS Loaded - Instant Interact FUNCIONAL!")
