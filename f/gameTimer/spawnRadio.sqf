private ["_unit"];
_unit = _this select 1;
_unit addItem "ItemRadio";
_unit setVariable ["pf_var_canSpawnRadio", false, false];