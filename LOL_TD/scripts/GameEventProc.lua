GameEventProc = {}

--添加事件 name-->事件类型  func-->方法
function GameEventProc.RegisterEventHandler(name, func)
 --[[   if (name == nil or func == nil) then
        Game.LogError("RegisterEventHandler中name或func为空")
        return
    end
    if (GameEventProc[name] == nil) then
        local a = {}
        table.insert(a, func)
        GameEventProc[name] = a
    else
        table.insert(GameEventProc[name], func)
    end]]
end
--移除事件
function GameEventProc.UnregisterEventHandler(name, func)
    if (name == nil or func == nil) then
        Game.LogError("UnregisterEventHandler中name或func为空")
        return
    end
    local a = GameEventProc[name]
    for i = #a, 1, -1 do
        if (a[i] == func) then
            table.remove(a, i)
            break
        end
    end
end

--派发事件
function GameEventProc.SendEvent(eventType, ...)
  --[[  if (eventType ~= nil) then
        local a = GameEventProc[eventType]
        if (a ~= nil) then
            for i = 1, #a do
                a[i](...)
            end
        end
    end]]
end
