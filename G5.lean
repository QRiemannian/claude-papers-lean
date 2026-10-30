-- G5: index of the units of Claude Paper No. 1 — one Challenge import per unit.
-- Solution files are NEVER imported here: a Solution restates the unit's definitions block
-- (CO's ruling, no import of Challenge), so Challenge + Solution in one environment clash
-- ("environment already contains ZPhi.ext.match_1", measured 2026-10-30T10:33Z). Solutions are
-- built by their own target (`lake build G5.<Unit>.Solution`) and by the comparator/gate.
import G5.Ring.Challenge
import G5.WordLevel.Challenge
import G5.Congruence.Challenge
import G5.Sector.Challenge
import G5.Ladder.Challenge
