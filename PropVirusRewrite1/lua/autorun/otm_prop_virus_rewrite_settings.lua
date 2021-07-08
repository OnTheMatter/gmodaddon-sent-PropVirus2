AddCSLuaFile()

if SERVER then return end

hook.Add("PopulateToolMenu", "otm_prop_virus_rewrite_function_hook_plz_no_conflicts_plzzzzzz", function()
	spawnmenu.AddToolMenuOption("Utilities", "Admin", "Prop Virus", "Prop Virus", "", "", OTM_PROP_VIRUS_REWRITE_SETTINGS_PANEL_INIT)
end)

function OTM_PROP_VIRUS_REWRITE_SETTINGS_PANEL_INIT(panel)
	panel:SetName("Prop Virus 2 Settings");
	panel:TextEntry("Prop Model","otm_prop_virus_rewrite_model");
	panel:TextEntry("Prop Material","otm_prop_virus_rewrite_base_material");
	panel:CheckBox("Random Color?","otm_prop_virus_rewrite_random_color");
	local otm_base_color_picker = vgui.Create("DColorMixer",panel,"Base Color");
	otm_base_color_picker:Dock(BOTTOM);
	otm_base_color_picker:SetConVarR("otm_prop_virus_rewrite_base_color_r")
	otm_base_color_picker:SetConVarG("otm_prop_virus_rewrite_base_color_g")
	otm_base_color_picker:SetConVarB("otm_prop_virus_rewrite_base_color_b")
	otm_base_color_picker:SetConVarA("otm_prop_virus_rewrite_base_color_a")
	otm_base_color_picker:SetAlphaBar(false);



	panel:Help("Infection Settings")
	panel:NumberWang("Spawn Amount","otm_prop_virus_rewrite_infection_spawn_count",0,8192);
	panel:CheckBox("Infect Physics Props","otm_prop_virus_rewrite_can_infect_physics_props");
	panel:CheckBox("Infect Other Props","otm_prop_virus_rewrite_can_infect_other_props");
	panel:CheckBox("Infect Brush Entities","otm_prop_virus_rewrite_can_infect_brush_entities");
	panel:CheckBox("Infect NPCs","otm_prop_virus_rewrite_can_infect_npcs");
	panel:CheckBox("Infect Players","otm_prop_virus_rewrite_can_infect_players");

	panel:Help("Misc. Settings")
	panel:CheckBox("Can Swim?","otm_prop_virus_rewrite_can_swim");


end