// PointFire - Player Nametag Script (Thanks to KillzoneKid)
if (!hasInterface) exitWith {};
_nametag = {
    _x = _this select 0;
    waitUntil {sleep 0.1; !isNull _x};
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
    _group = [groupID (group _target), ' '] call CBA_fnc_split;
    _class = toUpper(_target getVariable 'f_var_assignGear');
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
        name _target + ' (' + toUpper(_group select 1) + '-' + (_class) + ')',
        2,
        0.03,
        'PuristaBold'
    ];
    false
    "]];
};
{
    if ((side _x) == playerSide) then {
        if (_x getVariable ["pf_nametag", 1] == 1) then {
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
        'PuristaLight'
    ];
    false
    "]];
};
_include = _this select 0;
if (!isNil "_include") then {
	{
	    if (_x getVariable ["pf_nametag", 1] == 1) then {
	        [_x] call _nametagIncludes;
	    };
	} forEach (_include - [player]);
};