-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Baronet_Romwe
-----------------------------------
require("scripts/globals/titles");

function onMobDeath(mob, player, isKiller)
    player:addTitle(HELLSBANE);
end;

function onMobDespawn(mob)
end;
