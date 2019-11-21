/*
 * Authors: Chatter and M3ales
 * Saves current Long Range radio data to _radioData,
 * Pushes _radio data to setRadioData with TRUE to save Long Trange
 * Outputs "Saved SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call CHTR_TFAR_Setter_fnc_saveLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

LOG("Saving LR Settings");
_radioData = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
[true, _radioData] call FUNC(setRadioData);

if(_showResult) then {
	["Saved LR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
//check it saved correctly, return result
0