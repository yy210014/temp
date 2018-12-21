ABILITY_STATE_COOLDOWN = 1 --技能数据 冷却时间
ABILITY_DATA_TARGS = 100 --技能数据 目标允许
ABILITY_DATA_CAST = 101 --技能数据 施放时间
ABILITY_DATA_DUR = 102 --技能数据 持续时间(普通)
ABILITY_DATA_HERODUR = 103 --技能数据 持续时间(英雄)
ABILITY_DATA_COST = 104 --技能数据 魔法消耗
ABILITY_DATA_COOL = 105 --技能数据 施放间隔
ABILITY_DATA_AREA = 106 --技能数据 影响区域
ABILITY_DATA_RNG = 107 --技能数据 施法距离
ABILITY_DATA_DATA_A = 108 --技能数据 数据A
ABILITY_DATA_DATA_B = 109 --技能数据 数据B
ABILITY_DATA_DATA_C = 110 --技能数据 数据C
ABILITY_DATA_DATA_D = 111 --技能数据 数据D
ABILITY_DATA_DATA_E = 112 --技能数据 数据E
ABILITY_DATA_DATA_F = 113 --技能数据 数据F
ABILITY_DATA_DATA_G = 114 --技能数据 数据G
ABILITY_DATA_DATA_H = 115 --技能数据 数据H
ABILITY_DATA_DATA_I = 116 --技能数据 数据I
ABILITY_DATA_UNITID = 117 --技能数据 单位id
ABILITY_DATA_HOTKET = 200 --技能数据 热键
ABILITY_DATA_UNHOTKET = 201 --技能数据 关闭热键
ABILITY_DATA_RESEARCH_HOTKEY = 202 --技能数据 学习热键
ABILITY_DATA_NAME = 203 --技能数据 名字
ABILITY_DATA_ART = 204 --技能数据 图标
ABILITY_DATA_TARGET_ART = 205 --技能数据 目标效果
ABILITY_DATA_CASTER_ART = 206 --技能数据 施法者效果
ABILITY_DATA_EFFECT_ART = 207 --技能数据 目标点效果
ABILITY_DATA_AREAEFFECT_ART = 208 --技能数据 区域效果
ABILITY_DATA_MISSILE_ART = 209 --技能数据 投射物
ABILITY_DATA_SPECIAL_ART = 210 --技能数据 特殊效果
ABILITY_DATA_LIGHTNING_EFFECT = 211 --技能数据 闪电效果
ABILITY_DATA_BUFF_TIP = 212 --技能数据 Buff提示
ABILITY_DATA_BUFF_UBERTIP = 213 --技能数据 Buff提示(扩展)
ABILITY_DATA_RESEARCH_TIP = 214 --技能数据 学习提示
ABILITY_DATA_TIP = 215 --技能数据 提示
ABILITY_DATA_UNTIP = 216 --技能数据 关闭提示
ABILITY_DATA_RESEARCH_UBERTIP = 217 --技能数据 学习提示(扩展)
ABILITY_DATA_UBERTIP = 218 --技能数据 提示(扩展)
ABILITY_DATA_UNUBERTIP = 219 --技能数据 关闭提示(扩展)
ABILITY_DATA_UNART = 220 --技能数据

EVENT_DAMAGE_DATA_VAILD = 0
EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
EVENT_DAMAGE_DATA_IS_ATTACK = 2
EVENT_DAMAGE_DATA_IS_RANGED = 3
EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
EVENT_DAMAGE_DATA_ATTACK_TYPE = 6

YDWE_OBJECT_TYPE_ABILITY = 0
YDWE_OBJECT_TYPE_BUFF = 1
YDWE_OBJECT_TYPE_UNIT = 2
YDWE_OBJECT_TYPE_ITEM = 3
YDWE_OBJECT_TYPE_UPGRADE = 4
YDWE_OBJECT_TYPE_DOODAD = 5
YDWE_OBJECT_TYPE_DESTRUCTABLE = 6

EXGetUnitAbility = _native_ "EXGetUnitAbility"
EXGetUnitAbilityByIndex = _native_ "EXGetUnitAbilityByIndex"
EXGetAbilityId = _native_ "EXGetAbilityId"
EXGetAbilityState = _native_ "EXGetAbilityState"
EXSetAbilityState = _native_ "EXSetAbilityState" --设置技能冷却时间
EXGetAbilityDataReal = _native_ "EXGetAbilityDataReal"
EXSetAbilityDataReal = _native_ "EXSetAbilityDataReal" --设置技能数据
EXGetAbilityDataInteger = _native_ "EXGetAbilityDataInteger"
EXSetAbilityDataInteger = _native_ "EXSetAbilityDataInteger" --设置技能数据
EXGetAbilityDataString = _native_ "EXGetAbilityDataString"
EXSetAbilityDataString = _native_ "EXSetAbilityDataString" --设置技能数据
EXSetAbilityAEmeDataA = _native_ "EXSetAbilityAEmeDataA" 
EXGetEventDamageData = _native_ "EXGetEventDamageData"
EXSetEventDamage = _native_ "EXSetEventDamage"

EXGetEffectX = _native_ "EXGetEffectX"
EXGetEffectY = _native_ "EXGetEffectY"
EXGetEffectZ = _native_ "EXGetEffectZ"
EXSetEffectXY = _native_ "EXSetEffectXY"
EXSetEffectZ = _native_ "EXSetEffectZ"
EXGetEffectSize = _native_ "EXGetEffectSize"
EXSetEffectSize = _native_ "EXSetEffectSize"
EXEffectMatRotateX = _native_ "EXEffectMatRotateX"
EXEffectMatRotateY = _native_ "EXEffectMatRotateY"
EXEffectMatRotateZ = _native_ "EXEffectMatRotateZ"
EXEffectMatScale = _native_ "EXEffectMatScale"
EXEffectMatReset = _native_ "EXEffectMatReset"
EXSetEffectSpeed = _native_ "EXSetEffectSpeed"

CHAT_RECIPIENT_ALL = 0 --对所有人发言
CHAT_RECIPIENT_ALLIES = 1 --对盟军发言
CHAT_RECIPIENT_OBSERVERS = 2 --对观看者发言
CHAT_RECIPIENT_REFEREES = 2 --对裁判发言
CHAT_RECIPIENT_PRIVATE = 3 --对私人频道发言
EXDisplayChat = _native_ "EXDisplayChat" --模拟玩家发言

EXExecuteScript = _native_ "EXExecuteScript" --动态加载lua脚本代码 必须要返回一个字符串 因为acb没判断无返回值 会导致魔兽崩溃

EXSetUnitFacing = _native_ "EXSetUnitFacing" --设置单位面向角度
EXPauseUnit = _native_ "EXPauseUnit" --设置单位眩晕
EXSetUnitCollisionType = _native_ "EXSetUnitCollisionType" --(关/开)单位碰撞
EXSetUnitMoveType = _native_ "EXSetUnitMoveType" --设置单位移动类型


ITEM_DATA_ART = 1 --物品数据 图标
ITEM_DATA_UBERTIP = 3 --物品数据 提示(扩展)
ITEM_DATA_NAME = 4 --物品数据 提示
EXGetItemDataString = _native_ "EXGetItemDataString"
EXSetItemDataString = _native_ "EXSetItemDataString"  --设置物品数据


EXBlendButtonIcon= _native_ "EXBlendButtonIcon"--合成新的图标
