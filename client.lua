local menuIsOpen = false
RegisterKeyMapping('TooglePhone', 'Open Phone', 'keyboard', 'f1');

RegisterCommand("TooglePhone",function()
	TooglePhone()
end)

RegisterNUICallback('focusphone', function(data, cb)
	if menuIsOpen then
	  SetNuiFocusKeepInput(data.focusphone)
	end
end)

function TooglePhone() 
		menuIsOpen = not menuIsOpen
		SendNUIMessage({show = menuIsOpen})
		if menuIsOpen == true then 
		  SetNuiFocus(true, true)
		  SetNuiFocusKeepInput(true)
		else
		  SetNuiFocus(false, false)
		  SetNuiFocusKeepInput(false)
		end
end

RegisterNUICallback('closePhone', function(data, cb)
	menuIsOpen = false
	SendNUIMessage({show = false})
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	cb()
end)