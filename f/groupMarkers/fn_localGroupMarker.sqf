// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grp","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr","_grpName"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

call compile format ["
if(!isnil '%1') then
{
	_grp = %1;
};
",_this select 0];

_grpName = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_mkrName = format ["mkr_%1",_grpName];

// ====================================================================================

// WAIT FOR GROUP TO EXIST IN-MISSION
// We wait for the group to have members before creating the marker.

if (isNil "_grp") then
{
	call compile format ["
		waitUntil {
		sleep 3;
		if(!isnil '%1') then
		{
			count units %1 > 0
		};
		};
		_grp = %1;

	",_grpName];

};

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART I)
// If the group is empty, this script exits.

if (isnil "_grp") exitWith {};

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

switch (_mkrType) do
{

// Platoon HQ
	case 0:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal "b_hq";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Fireteam
	case 1:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_inf";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Machineguns (MMG, HMG)
	case 2:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_support";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Launchers (MAT, HAT, SAM)
	case 3:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_motor_inf";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Sniper Team
	case 4:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_recon";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Mortar Team
	case 5:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_mortar";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Engineers
	case 6:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_maint";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// IFVs and APCs
	case 7:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_mech_inf";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Tanks
	case 8:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_armor";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Transport and Attack Helos
	case 9:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_air";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Planes and jets
	case 10:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_plane";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
// Artillery
	case 11:
	{
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerTypeLocal  "b_art";
		_mkrName setMarkerColorLocal _mkrColor;
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerAlphaLocal 0.6;
	};
};

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group exists) the marker
// position is updated periodically. This only happens locally - so as not to burden
// the server.

while {{!isNull _x} count units _grp > 0} do
{
	_mkrName setMarkerPosLocal [(getPos leader _grp select 0),(getPos leader _grp select 1)];
	sleep 6;
};


// ====================================================================================


