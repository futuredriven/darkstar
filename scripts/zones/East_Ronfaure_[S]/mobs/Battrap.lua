-----------------------------------
-- Area: East Ronfaure [S]
--  MOB: Battrap
-- Note:  Place Holder for Goblintrap NM
-- !pos 156 0 -438 81
-----------------------------------

require("scripts/zones/East_Ronfaure_[S]/MobIDs");
require("scripts/globals/mobs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    phOnDespawn(mob,GOBLINTRAP_PH,5,3600);

end;

