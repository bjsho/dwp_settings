scoreboard players enable @a dwp_plb_toggle
scoreboard players enable @a dwp_plb_toggle_bar
scoreboard players enable @a dwp_plb_get_settings


# SHOW players location on the location bar
execute as @a if score @s dwp_plb_toggle matches 1 run attribute @s minecraft:waypoint_transmit_range base set 0

tag @a[scores={dwp_plb_toggle=1}] remove pplshown
tellraw @a[scores={dwp_plb_toggle=1},tag=!pplhidden] [{"color":"white","text":" Your location is now "},{"color":"red","text":"hidden"},{"color":"white","text":" from other players!"}]
tag @a[scores={dwp_plb_toggle=1}] add pplhidden

execute as @a if score @s dwp_plb_toggle matches 2.. run scoreboard players set @s dwp_plb_toggle 0


# HIDE players location on the location bar
execute as @a if score @s dwp_plb_toggle matches ..0 run attribute @s minecraft:waypoint_transmit_range base set 60000000

tag @a[scores={dwp_plb_toggle=0}] remove pplhidden
tellraw @a[scores={dwp_plb_toggle=0},tag=!pplshown] [{"color":"white","text":" Your location is now "},{"color":"green","text":"showing"},{"color":"white","text":" to other players!"}]
tag @a[scores={dwp_plb_toggle=0}] add pplshown

execute as @a if score @s dwp_plb_toggle_bar matches 1.. run attribute @s minecraft:waypoint_receive_range base set 0
execute as @a if score @s dwp_plb_toggle_bar matches 2.. run scoreboard players set @s dwp_plb_toggle_bar 0
execute as @a if score @s dwp_plb_toggle_bar matches ..0 run attribute @s minecraft:waypoint_receive_range base set 60000000


# Show settings
execute as @a[scores={dwp_plb_get_settings=1..}] if score @s dwp_plb_toggle_bar matches 1 run tellraw @p [{"color":"white","text":" Locatorbar: "},{"color":"red","text":"false"}]
execute as @a[scores={dwp_plb_get_settings=1..}] if score @s dwp_plb_toggle_bar matches 0 run tellraw @p [{"color":"white","text":" Locatorbar: "},{"color":"green","text":"true"}]
execute as @a[scores={dwp_plb_get_settings=1..}] if score @s dwp_plb_toggle matches 1 run tellraw @p [{"color":"white","text":" Location: "},{"color":"red","text":"Hidden"}]
execute as @a[scores={dwp_plb_get_settings=1..}] if score @s dwp_plb_toggle matches 0 run tellraw @p [{"color":"white","text":" Location: "},{"color":"green","text":"Shown"}]

execute as @a[scores={dwp_plb_get_settings=1..}] run scoreboard players set @s dwp_plb_get_settings 0
