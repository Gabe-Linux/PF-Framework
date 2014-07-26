enableSaving [false, false];
enableSentences false;
enableTeamswitch false;
enableRadio false;
0 fadeRadio 0;

// PointFire - Mission Timer - Input value is time until game start (in minutes)
[] execVM "f\gameTimer\timer.sqf";

// PointFire - Nametags
[[[], f_fnc_nametags], "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;

// Outlawled - Mag Repack
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";

// F3 - Briefing
f_script_briefing = [] execVM "briefing.sqf";

// F3 - F3 Folk ARPS Group IDs
f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// F3 - F3 Folk ARPS Group Markers
f_script_setGroupMarkers = [] execVM "f\groupMarkers\f_setLocalGroupMarkers.sqf";

// F3 - F3 Common Local Variables
f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

// F3 - Automatic Body Removal
f_var_removeBodyDelay = 300;
f_var_removeBodyDistance = 500;
f_var_doNotRemoveBodies = [];
[] execVM "f\removeBody\f_addRemoveBodyEH.sqf";

// F3 - ORBAT Notes
[] execVM "f\briefing\f_orbatNotes.sqf";

// F3 - JIP setup
f_var_JIP_FirstMenu = false;		// Do players connecting for the first time get the JIP menu? - This only works in missions with respawn.
f_var_JIP_RemoveCorpse = false;		// Remove the old corpse of respawning players?
f_var_JIP_GearMenu = false;			// Can JIP/respawned players select their own gear? False will use gear assigned by F3 Gear Component if possible

// F3 - AI Unit Caching
[30] spawn f_fnc_cInit;

// F3 - AI Unit Caching
[30] spawn f_fnc_cInit;
f_var_cachingAggressiveness = 2;

// F3 - Radio Framework
[] execVM "f\radios\radio_init.sqf";

// ====================================================================================

// F3 - Casualties Cap

// [[GroupName or SIDE],100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
// [[GroupName or SIDE],100,{code}] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// BLUFOR > NATO
// [BLUFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// OPFOR > CSAT
// [OPFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// INDEPENDENT > AAF
// [INDEPENDENT,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";