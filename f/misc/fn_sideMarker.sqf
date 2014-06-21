// Example usage: ["markerName", "This is BlueFor only my marker!", blufor] call f_fnc_sideMarker;

if (!hasInterface) exitWith {};
private ["_mkr", "_text", "_side"];
_mkr = _this select 0;
_text = _this select 1;
_side = _this select 2;
if (playerSide == _side) then {
	call {
		if (playerSide == blufor) exitWith {
			_mkr setMarkerTypeLocal "hd_dot";
			_mkr setMarkerTextLocal _text;
			_mkr setMarkerColorLocal "ColorBlue";
		};
		if (playerSide == opfor) exitWith {
			_mkr setMarkerTypeLocal "hd_dot";
			_mkr setMarkerTextLocal _text;
			_mkr setMarkerColorLocal "ColorRed";
		};
		if (playerSide == resistance) exitWith {
			_mkr setMarkerTypeLocal "hd_dot";
			_mkr setMarkerTextLocal _text;
			_mkr setMarkerColorLocal "ColorGreen";
		};
		_mkr setMarkerTypeLocal "hd_dot";
		_mkr setMarkerTextLocal _text;
	};	
};