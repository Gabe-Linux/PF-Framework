_clientTimer = {
	if (!hasInterface) exitWith {};
	if (!isNil "pf_var_clientTimerCalled") exitWith {};
	pf_var_clientTimerCalled = true;
	waitUntil {
		hintSilent format ["%1 Minute(s) until game begins!", gameTimer];
		gameTimer < 1;
	};
	hint "The game has begun!";
	if (f_param_spawn_radio == 1) then {
		player addAction ["Spawn Radio", "f\gameTimer\spawnRadio.sqf", "", 1, false, true, "", "((leader (group player) == player) && (player getVariable ['pf_var_canSpawnRadio', true]))"];
	};
	[] execVM "f\gameTimer\clientBegin.sqf";
};

_serverTimer = {
	gameTimer = _this select 0;
	publicVariable "gameTimer";
	{waitUntil{alive _x}} forEach playableUnits;
	[_clientTimer, "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
	for [{_i = gameTimer}, {_i > 0 }, {_i = _i - 1}] do {
		sleep 60;
		gameTimer = gameTimer - 1;
		publicVariable "gameTimer";
	};
	[] execVM "f\gameTimer\serverBegin.sqf";
};

if (isServer) then {
	[f_param_game_timer] call _serverTimer;
};