--hardware

--获取鼠标在游戏内的坐标X
DzGetMouseTerrainX = _native_ "DzGetMouseTerrainX"

--获取鼠标在游戏内的坐标Y
DzGetMouseTerrainY = _native_ "DzGetMouseTerrainY"

--获取鼠标在游戏内的坐标Z
DzGetMouseTerrainZ = _native_ "DzGetMouseTerrainZ"

--鼠标是否在游戏内
DzIsMouseOverUI = _native_ "DzIsMouseOverUI"

--获取鼠标屏幕坐标X
DzGetMouseX = _native_ "DzGetMouseX"

--获取鼠标屏幕坐标Y
DzGetMouseY = _native_ "DzGetMouseY"

--获取鼠标游戏窗口坐标X
DzGetMouseXRelative = _native_ "DzGetMouseXRelative"

--获取鼠标游戏窗口坐标Y
DzGetMouseYRelative = _native_ "DzGetMouseYRelative"

--设置鼠标位置
DzSetMousePos = _native_ "DzSetMousePos"

--注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
DzTriggerRegisterMouseEvent = _native_ "DzTriggerRegisterMouseEvent"
DzTriggerRegisterMouseEventByCode = _native_ "DzTriggerRegisterMouseEventByCode"

--注册键盘点击触发
DzTriggerRegisterKeyEvent = _native_ "DzTriggerRegisterMouseEvent"
DzTriggerRegisterKeyEventByCode = _native_ "DzTriggerRegisterMouseEvent"

--注册鼠标滚轮触发
DzTriggerRegisterMouseWheelEvent = _native_ "DzTriggerRegisterMouseWheelEvent"
DzTriggerRegisterMouseWheelEventByCode = _native_ "DzTriggerRegisterMouseWheelEventByCode"

--注册鼠标移动触发
DzTriggerRegisterMouseMoveEvent = _native_ "DzTriggerRegisterMouseMoveEvent"
DzTriggerRegisterMouseMoveEventByCode = _native_ "DzTriggerRegisterMouseMoveEventByCode"

--获取触发器的按键码
DzGetTriggerKey = _native_ "DzGetTriggerKey"

--获取滚轮delta
DzGetWheelDelta = _native_ "DzGetWheelDelta"

--判断按键是否按下
DzIsKeyDown = _native_ "DzIsKeyDown"

--获取触发key的玩家
DzGetTriggerKeyPlayer = _native_ "DzGetTriggerKeyPlayer"

--获取war3窗口宽度
DzGetWindowWidth = _native_ "DzGetWindowWidth"

--获取war3窗口高度
DzGetWindowHeight = _native_ "DzGetWindowHeight"

--获取war3窗口X坐标
DzGetWindowX = _native_ "DzGetWindowX"

--获取war3窗口Y坐标
DzGetWindowY = _native_ "DzGetWindowY"

--注册war3窗口大小变化事件
DzTriggerRegisterWindowResizeEvent = _native_ "DzTriggerRegisterWindowResizeEvent"
DzTriggerRegisterWindowResizeEventByCode = _native_ "DzTriggerRegisterWindowResizeEventByCode"

--判断窗口是否激活
DzIsWindowActive = _native_ "DzIsWindowActive"

--plus

--设置可摧毁物位置
DzDestructablePosition = _native_ "DzDestructablePosition"

--设置单位位置-本地调用
DzSetUnitPosition = _native_ "DzSetUnitPosition"

--异步执行函数
DzExecuteFunc = _native_ "DzExecuteFunc"

--取鼠标指向的unit
DzGetUnitUnderMouse = _native_ "DzGetUnitUnderMouse"

--设置unit的贴图
DzSetUnitTexture = _native_ "DzSetUnitTexture"

--设置内存数值
DzSetMemory = _native_ "DzSetMemory"

--设置单位ID
DzSetUnitID = _native_ "DzSetUnitID"

--设置单位模型
DzSetUnitModel = _native_ "DzSetUnitModel"

--设置小地图背景图片
DzSetWar3MapMap = _native_ "DzSetWar3MapMap"

--sync

--注册数据同步trigger
DzTriggerRegisterSyncData = _native_ "DzTriggerRegisterSyncData"

--同步游戏数据
DzSyncData = _native_ "DzSyncData"

--获取同步的数据
DzGetTriggerSyncData = _native_ "DzGetTriggerSyncData"

--获取同步数据的玩家
DzGetTriggerSyncPlayer = _native_ "DzGetTriggerSyncPlayer"

--gui

------------------------------/ 原生UI修改
--隐藏界面元素
DzFrameHideInterface = _native_ "DzFrameHideInterface"

--修改游戏世界窗口位置
DzFrameEditBlackBorders = _native_ "DzFrameEditBlackBorders"

--头像
DzFrameGetPortrait = _native_ "DzFrameGetPortrait"

--小地图
DzFrameGetMinimap = _native_ "DzFrameGetMinimap"

--技能按钮
DzFrameGetCommandBarButton = _native_ "DzFrameGetCommandBarButton"

--英雄按钮
DzFrameGetHeroBarButton = _native_ "DzFrameGetHeroBarButton"

--英雄血条
DzFrameGetHeroHPBar = _native_ "DzFrameGetHeroHPBar"

--英雄蓝条
DzFrameGetHeroManaBar = _native_ "DzFrameGetHeroManaBar"

--道具按钮

--小地图按钮
DzFrameGetItemBarButton = _native_ "DzFrameGetItemBarButton"
DzFrameGetMinimapButton = _native_ "DzFrameGetMinimapButton"

--左上菜单按钮
DzFrameGetUpperButtonBarButton = _native_ "DzFrameGetUpperButtonBarButton"

--鼠标提示
DzFrameGetTooltip = _native_ "DzFrameGetTooltip"

--聊天信息
DzFrameGetChatMessage = _native_ "DzFrameGetChatMessage"

--unit message
DzFrameGetUnitMessage = _native_ "DzFrameGetUnitMessage"

--top message
DzFrameGetTopMessage = _native_ "DzFrameGetTopMessage"

------------------------------/
--取rgba色值
DzGetColor = _native_ "DzGetColor"

--设置界面更新回调（非同步）
DzFrameSetUpdateCallback = _native_ "DzFrameSetUpdateCallback"
DzFrameSetUpdateCallbackByCode = _native_ "DzFrameSetUpdateCallbackByCode"

--显示/隐藏Frame
DzFrameShow = _native_ "DzFrameShow"

--创建frame
DzCreateFrame = _native_ "DzCreateFrame"

--创建SimpleFrame
DzCreateSimpleFrame = _native_ "DzCreateSimpleFrame"

--销毁frame
DzDestroyFrame = _native_ " takes integer frame returns nothing"

--加载toc
DzLoadToc = _native_ "DzLoadToc"

--设置frame相对位置
DzFrameSetPoint = _native_ "DzFrameSetPoint"

--设置frame绝对位置
DzFrameSetAbsolutePoint = _native_ "DzFrameSetAbsolutePoint"

--清空frame锚点
DzFrameClearAllPoints = _native_ "DzFrameClearAllPoints"

--设置frame禁用/启用
DzFrameSetEnable = _native_ "DzFrameSetEnable"

--注册UI事件回调
DzFrameSetScript = _native_ "DzFrameSetScript"
DzFrameSetScriptByCode = _native_ "DzFrameSetScriptByCode"

--获取触发ui的玩家
DzGetTriggerUIEventPlayer = _native_ "DzGetTriggerUIEventPlayer"

--获取触发的Frame
DzGetTriggerUIEventFrame = _native_ "DzGetTriggerUIEventFrame"

--查找frame
DzFrameFindByName = _native_ "DzFrameFindByName"

--查找SimpleFrame
DzSimpleFrameFindByName = _native_ "DzSimpleFrameFindByName"

--查找String
DzSimpleFontStringFindByName = _native_ "DzSimpleFontStringFindByName"

--查找Texture
DzSimpleTextureFindByName = _native_ "DzSimpleTextureFindByName"

--获取game ui
DzGetGameUI = _native_ "DzGetGameUI"

--点击frame
DzClickFrame = _native_ "DzClickFrame"

--自定义屏幕比例
DzSetCustomFovFix = _native_ "DzSetCustomFovFix"

--使用宽屏模式
DzEnableWideScreen = _native_ "DzEnableWideScreen"

--设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
DzFrameSetText = _native_ "DzFrameSetText"

--获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）
DzFrameGetText = _native_ "DzFrameGetText"

--设置字数限制（支持EditBox）
DzFrameSetTextSizeLimit = _native_ "DzFrameSetTextSizeLimit"

--获取字数限制（支持EditBox）
DzFrameGetTextSizeLimit = _native_ "DzFrameGetTextSizeLimit"

--设置文字颜色（支持TextFrame, EditBox）
DzFrameSetTextColor = _native_ "DzFrameSetTextColor"

--获取鼠标所在位置的ui控件指针
DzGetMouseFocus = _native_ "DzGetMouseFocus"

--设置所有锚点到目标frame上
DzFrameSetAllPoints = _native_ "DzFrameSetAllPoints"
--设置焦点
DzFrameSetFocus = _native_ "DzFrameSetFocus"

--设置模型（支持Sprite、Model、StatusBar）
DzFrameSetModel = _native_ "DzFrameSetModel"

--获取控件是否启用
DzFrameGetEnable = _native_ "DzFrameGetEnable"

--设置透明度（0-255）
DzFrameSetAlpha = _native_ "DzFrameSetAlpha"

--获取透明度
DzFrameGetAlpha = _native_ "DzFrameGetAlpha"

--设置动画
DzFrameSetAnimate = _native_ "DzFrameSetAnimate"

--设置动画进度（autocast为false是可用）
DzFrameSetAnimateOffset = _native_ "DzFrameSetAnimateOffset"

--设置texture（支持Backdrop、SimpleStatusBar）
DzFrameSetTexture = _native_ "DzFrameSetTexture"

--设置缩放
DzFrameSetScale = _native_ "DzFrameSetScale"

--设置tooltip
DzFrameSetTooltip = _native_ "DzFrameSetTooltip"

--鼠标限制在ui内
DzFrameCageMouse = _native_ "DzFrameCageMouse"

--获取当前值（支持Slider、SimpleStatusBar、StatusBar）
DzFrameGetValue = _native_ "DzFrameGetValue"

--设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）
DzFrameSetMinMaxValue = _native_ "DzFrameSetMinMaxValue"

--设置Step值（支持Slider）
DzFrameSetStepValue = _native_ "DzFrameSetStepValue"

--设置当前值（支持Slider、SimpleStatusBar、StatusBar）
DzFrameSetValue = _native_ "DzFrameSetValue"

--根据tag创建frame
DzCreateFrameByTagName = _native_ "DzCreateFrameByTagName"

--设置frame大小
DzFrameSetSize = _native_ "DzFrameSetSize"

--设置颜色（支持SimpleStatusBar）
DzFrameSetVertexColor = _native_ "DzFrameSetVertexColor"

--DzFrameSetPoint achor定义，从0开始
AnchorPoint = {
    TOPLEFT = 0,
    TOP = 1,
    TOPRIGHT = 2,
    LEFT = 3,
    CENTER = 4,
    RIGHT = 5,
    BOTTOMLEFT = 6,
    BOTTOM = 7,
    BOTTOMRIGHT = 8
}

--DzFrameSetScript  注册ui事件的事件ID
CFrameEvents = {
    NONE = 0,
    FRAME_EVENT_PRESSED = 1,
    FRAME_MOUSE_ENTER = 2,
    FRAME_MOUSE_LEAVE = 3,
    FRAME_FOCUS_ENTER = 2,
    FRAME_FOCUS_LEAVE = 3,
    FRAME_MOUSE_UP = 4,
    FRAME_MOUSE_DOWN = 5,
    FRAME_MOUSE_WHEEL = 6,
    FRAME_CHECKBOX_CHECKED = 7,
    FRAME_CHECKBOX_UNCHECKED = 8,
    FRAME_EDITBOX_TEXT_CHANGED = 9,
    FRAME_POPUPMENU_ITEM_CHANGE_START = 10,
    FRAME_POPUPMENU_ITEM_CHANGED = 11,
    FRAME_MOUSE_DOUBLECLICK = 12,
    FRAME_SPRITE_ANIM_UPDATE = 13
}
