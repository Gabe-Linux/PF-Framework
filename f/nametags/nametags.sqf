// PointFire - Player Name-tag Script (Thanks to KillzoneKid)
if (!hasInterface) exitWith {};
_nametag = {
    _x = _this select 0;
    waitUntil {!isNull _x};
    _x setVariable ["pf_nametag", _x addAction ["", "", "", 0, false, false, "", "
    if (!alive _target) exitWith {
        _target removeAction (_target getVariable 'pf_nametag');
    };
    if (captive _target) exitWith {};
    if (_target in units player) then {
        pf_nametagColor = [_target, 10, true] call STGI_GetColour;
    } else {
        pf_nametagColor = [0.820, 0.455, 0.196, 1];
    };
    _dist = (_this distance _target) / 15;
    pf_nametagColor set [3, 1 - _dist];
    _desc = [str _target, '_'] call CBA_fnc_split;
    drawIcon3D [
        '',
        pf_nametagColor,
        [
            visiblePosition _target select 0,
            visiblePosition _target select 1,
            (visiblePosition _target select 2) + 
            ((_target modelToWorld (
                _target selectionPosition 'head'
            )) select 2) + 0.4 + _dist / 1.5
        ],
        0,
        0,
        0,
        name _target + ' (' + (_desc select 1) + '-' + (_desc select 2) + ')',
        2,
        0.03,
        'PuristaMedium'
    ];
    false
    "]];
};
{
    if ((side _x) == playerSide) then {
        if (isNil "(_x getVariable 'pf_nametag')") then {
            [_x] call _nametag;
        };
    };
} forEach (playableUnits - [player]);
_nametagIncludes = {
    _x = _this select 0;
    waitUntil {!isNull _x};
    _x setVariable ["pf_nametag", _x addAction ["", "", "", 0, false, false, "", "
    if (!alive _target) exitWith {
        _target removeAction (_target getVariable 'pf_nametag');
    };
    pf_nametagColor = [0.2, 0, 0.4, 1];
    _dist = (_this distance _target) / 15;
    pf_nametagColor set [3, 1 - _dist];
    _desc = [str _target, '_'] call CBA_fnc_split;
    drawIcon3D [
        '',
        pf_nametagColor,
        [
            visiblePosition _target select 0,
            visiblePosition _target select 1,
            (visiblePosition _target select 2) + 
            ((_target modelToWorld (
                _target selectionPosition 'head'
            )) select 2) + 0.4 + _dist / 1.5
        ],
        0,
        0,
        0,
        name _target,
        2,
        0.03,
        'PuristaMedium'
    ];
    false
    "]];
};
_include = _this select 0;
if (!isNil "_include") then {
	{
	    if (isNil "(_x getVariable 'pf_nametag')") then {
	        [_x] call _nametagIncludes;
	    };
	} forEach (_include - [player]);
};