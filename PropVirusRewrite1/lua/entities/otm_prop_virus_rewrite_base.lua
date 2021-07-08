AddCSLuaFile()

DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Prop Virus"
ENT.Type 			= "ai"
ENT.Author			= "OnTheMatter"
ENT.Category		= "Prop Virus Rewrite"

ENT.Editable		= true
ENT.Spawnable		= true
ENT.AdminOnly		= true


if !ConVarExists("otm_prop_virus_rewrite_can_infect_physics_props") then
    CreateConVar("otm_prop_virus_rewrite_can_infect_physics_props", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_can_infect_other_props") then
    CreateConVar("otm_prop_virus_rewrite_can_infect_other_props", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_can_infect_brush_entities") then
    CreateConVar("otm_prop_virus_rewrite_can_infect_brush_entities", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_can_infect_npcs") then
    CreateConVar("otm_prop_virus_rewrite_can_infect_npcs", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_can_infect_players") then
    CreateConVar("otm_prop_virus_rewrite_can_infect_players", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_infection_spawn_count") then
    CreateConVar("otm_prop_virus_rewrite_infection_spawn_count", '3', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_random_color") then
    CreateConVar("otm_prop_virus_rewrite_random_color", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_base_color_r") then
    CreateConVar("otm_prop_virus_rewrite_base_color_r", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_base_color_g") then
    CreateConVar("otm_prop_virus_rewrite_base_color_g", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_base_color_b") then
    CreateConVar("otm_prop_virus_rewrite_base_color_b", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_base_color_a") then
    CreateConVar("otm_prop_virus_rewrite_base_color_a", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_can_swim") then
    CreateConVar("otm_prop_virus_rewrite_can_swim", '1', {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_model") then
    CreateConVar("otm_prop_virus_rewrite_model", "models/props_junk/watermelon01.mdl", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

if !ConVarExists("otm_prop_virus_rewrite_base_material") then
    CreateConVar("otm_prop_virus_rewrite_base_material", "", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY})
end

//Server-side convar messy stuff
if (SERVER) then

	net.Receive("otm_prop_virus_rewrite_can_infect_physics_props", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_infect_physics_props", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_can_infect_other_props", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_infect_other_props", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_can_infect_brush_entities", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_infect_brush_entities", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_can_infect_npcs", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_infect_npcs", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_can_infect_players", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_infect_players", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_infection_spawn_count", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_infection_spawn_count", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_random_color", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_random_color", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_base_color_r", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_base_color_r", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_base_color_g", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_base_color_g", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_base_color_b", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_base_color_b", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_base_color_a", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_base_color_a", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_can_swim", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_can_swim", net.ReadFloat())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_model", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_model", net.ReadString())
		end
	end)

	net.Receive("otm_prop_virus_rewrite_base_material", function(len,ply)
		if ply:IsValid() and ply:IsPlayer() and ply:IsAdmin() then
			RunConsoleCommand("otm_prop_virus_rewrite_base_material", net.ReadString())
		end
	end)

end

/*
function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create( "otm_prop_virus_rewrite_base" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	return ent
end
*/

function ENT:SetupDataTables()
	self:NetworkVar("Bool",0,"CanInfectPhysicsProps",{KeyName="caninfectphysicsprops",Edit = {type = "Bool", order = 1,title = "Can Infect Physics Props?", category = "Victim Options"}});
	self:NetworkVar("Bool",1,"CanInfectOtherProps",{KeyName="caninfectotherprops",Edit = {type = "Bool", order = 2,title = "Can Infect Other Props?",category = "Victim Options"}});
	self:NetworkVar("Bool",2,"CanInfectBrushEntities",{KeyName="caninfectbrushentities",Edit = {type = "Bool", order = 3,title = "Can Infect Brush Entities?",category = "Victim Options"}});
	self:NetworkVar("Bool",3,"CanInfectNPCs",{KeyName="caninfectnpcs",Edit = {type = "Bool", order = 4,title = "Can Infect NPCs?",category = "Victim Options"}});
	self:NetworkVar("Bool",4,"CanInfectPlayers",{KeyName="caninfectplayers",Edit = {type = "Bool", order = 5,title = "Can Infect Players?",category = "Victim Options"}});
	self:NetworkVar("Int",0,"InfectionSpawnCount",{KeyName="infectionspawncount",Edit = {type = "Int", min = 0, max = 25,order = 6, title = "Infection Spawn Amount",category = "Infection"}});
	self:NetworkVar("Vector",0,"PropVirusColor",{KeyName="propviruscolor",Edit = {type = "VectorColor", order = 7,title = "Color", category = "General Properties"}});
	self:NetworkVar("String",0,"PropVirusModel",{KeyName="propvirusmodel"});
	self:NetworkVar("String",1,"PropVirusMaterial",{KeyName="propvirusmaterial",Edit={type="String",order = 8, title = "Material",category = "General Properties"}});
	self:NetworkVar("Int",1,"PropVirusMaxHealth",{KeyName="propvirusmaxhealth",Edit={type = "Generic",waitforenter = true,order = 9, title = "Max Health", category = "General Properties"}});
	self:NetworkVar("Int",2,"PropVirusZJumpForce",{KeyName="propviruszjumpforce",Edit={type= "Generic",waitforenter = true,order = 10, title = "Upwards Jump Force",category = "General Properties"}});
	self:NetworkVar("Int",3,"PropVirusJumpForce",{KeyName="propvirusjumpforce",Edit={type= "Generic",waitforenter = true,order = 11, title = "Jump Force",category = "General Properties"}});
	self:NetworkVar("Float",0,"PropVirusJumpDelay",{KeyName="propvirusjumpdelay",Edit={type= "Generic",waitforenter = true, order = 12, title = "Jump Delay", category = "General Properties"}});
	self:NetworkVar("Float",1,"PropVirusJumpDelayVariance",{KeyName = "propvirusjumpdelayvariance",Edit = {type = "Generic",waitforenter = true,order = 13, title = "Jump Delay Variance",category = "General Properties"}});
	self:NetworkVar("Bool",5,"PropVirusCanSwim",{KeyName = "propviruscanswim",Edit={type = "Bool",order = 14,title = "Can Swim?",category = "General Properties"}});

	if (SERVER) then
		self:NetworkVarNotify("PropVirusColor",self.otm_prop_virus_rewrite_base_color_change);
		self:NetworkVarNotify("PropVirusMaterial",self.otm_prop_Virus_rewrite_base_material_change);
		self:NetworkVarNotify("PropVirusMaxHealth",self.otm_prop_virus_rewrite_base_max_health_change);
		self:SetCanInfectPhysicsProps(GetConVar("otm_prop_virus_rewrite_can_infect_physics_props"):GetInt()==1);
		self:SetCanInfectOtherProps(GetConVar("otm_prop_virus_rewrite_can_infect_other_props"):GetInt()==1);
		self:SetCanInfectBrushEntities(GetConVar("otm_prop_virus_rewrite_can_infect_brush_entities"):GetInt()==1);
		self:SetCanInfectNPCs(GetConVar("otm_prop_virus_rewrite_can_infect_npcs"):GetInt()==1);
		self:SetCanInfectPlayers(GetConVar("otm_prop_virus_rewrite_can_infect_players"):GetInt()==1);
		self:SetInfectionSpawnCount(GetConVar("otm_prop_virus_rewrite_infection_spawn_count"):GetInt());
		local otm_temp_color_vector = Vector(1,1,1);
		if (GetConVar("otm_prop_virus_rewrite_random_color"):GetInt() == 1) then
			otm_temp_color_vector = Vector(math.Rand(0,1),math.Rand(0,1),math.Rand(0,1));
		else
			otm_temp_color_vector = Vector(GetConVar("otm_prop_virus_rewrite_base_color_r"):GetFloat()/255,GetConVar("otm_prop_virus_rewrite_base_color_g"):GetFloat()/255,GetConVar("otm_prop_virus_rewrite_base_color_b"):GetFloat()/255)
		end
		self:SetPropVirusColor(otm_temp_color_vector);
		self:SetPropVirusModel(GetConVar("otm_prop_virus_rewrite_model"):GetString());
		self:SetPropVirusMaterial(GetConVar("otm_prop_virus_rewrite_base_material"):GetString());
		self:SetPropVirusMaxHealth(50);
		self:SetPropVirusZJumpForce(256);
		self:SetPropVirusJumpForce(128);
		self:SetPropVirusJumpDelay(5);
		self:SetPropVirusJumpDelayVariance(2);
		self:SetPropVirusCanSwim(GetConVar("otm_prop_virus_rewrite_can_swim"):GetInt()==1);
	end
end


if (true) then

	//MAIN FUNCTIONS


	//Base Functionality Methods

	function ENT:otm_base_hop_function()
		if (SERVER) then
			local otm_selfpositiontest = self:GetPos();
			local otm_can_jump = false;
			if (self:GetPropVirusCanSwim() and self:WaterLevel() > 0) then otm_can_jump = true end;
			if !(otm_can_jump) then

				local otm_temp_adjustment_vector = Vector(0,0,self:GetModelRadius() + 1);
				local otm_canjumptrace = util.TraceLine({start = otm_selfpositiontest + otm_temp_adjustment_vector,endpos = otm_selfpositiontest - otm_temp_adjustment_vector,filter = self});
				//print(otm_canjumptrace.Entity)
				if (otm_canjumptrace.Entity:IsWorld() or otm_canjumptrace.Entity:IsValid()) then otm_can_jump = true end;
			end
			if (otm_can_jump) then
				local otm_c_yaddayadda = self:GetPhysicsObject();
				local otm_c_xyjumpforce = self:GetPropVirusJumpForce();
				local otm_c_zjumpforce = self:GetPropVirusZJumpForce();
				otm_c_yaddayadda:ApplyForceCenter(otm_c_yaddayadda:GetMass()*Vector(math.random(-otm_c_xyjumpforce,otm_c_xyjumpforce),math.random(-otm_c_xyjumpforce,otm_c_xyjumpforce),math.random(-otm_c_zjumpforce,otm_c_zjumpforce)));
				//print("I Jumped!")
			end
		end
	end

	function ENT:otm_base_charge_function()

	end
	
	function ENT:otm_base_think_function()

	end

	function ENT:otm_base_spawn_function()

	end
	
	function ENT:otm_base_receive_damage_function(dmg)
		if (SERVER) then
			if (dmg:GetDamageType() == DMG_CRUSH) then return end
			self:GetPhysicsObject():ApplyForceOffset(dmg:GetDamageForce(),dmg:GetDamagePosition());
			self:SetHealth(self:Health() - dmg:GetDamage());
			if (self:Health() <= 0) then
				self:GibBreakClient(dmg:GetDamageForce());
				self:Remove();
			end
		end
	end
	
	function ENT:otm_base_infect_function()

	end

	function ENT:otm_base_remove_function()
		if (SERVER) then
			self:GibBreakClient(Vector(0,0,0));
		end
	end
	
	function ENT:otm_base_starttouch_function()

	end

	//Network Variable Changes


	function ENT:otm_prop_virus_rewrite_base_color_change(varname, oldvalue, newvalue)
		if (oldvalue == newvalue) then return end;
		//print(newvalue);
		self:SetColor(newvalue:ToColor());
	end

	function ENT:otm_prop_virus_rewrite_base_material_change(varname,oldvalue,newvalue)
		if (oldvalue == newvalue) then return end;
		self:SetMaterial(newvalue);
		local otm_physics_object_tempvar = self:GetPhysicsObject();
		if IsValid(otm_physics_object_tempvar) then
			otm_physics_object_tempvar:SetMaterial(newvalue);
		end
	end

	function ENT:otm_prop_virus_rewrite_base_max_health_change(varname,oldvalue,newvalue)
		if (oldvalue == newvalue) then return end;
		local otm_newhealthamount = math.abs(math.ceil(newvalue));
		if (otm_newhealthamount == 0) then otm_newhealthamount = 1 end;
		self:SetMaxHealth(otm_newhealthamount);
		self:SetHealth(otm_newhealthamount);
	end


	//Hop and Charge Hooks

	function ENT:otm_pv_hop()
		if (self.hop_additions_enabled) then
			for _, igig in ipairs(self.hop_functions) do
				igig();
			end
		end

		if (self.hop_base_enabled) then
			self:otm_base_hop_function()
		end
	end

	function ENT:otm_pv_charge()
		if (self.charge_additions_enabled) then
			for _, igig in ipairs(self.charge_functions()) do
				igig();
			end
		end

		if (self.charge_base_enabled) then
			self:otm_base_charge_function()
		end
	end

	//Main Hooks

	function ENT:Initialize()
		self:SetMaterial(self:GetPropVirusMaterial());
		if (SERVER) then
			//generic initialization of the prop
			self:SetModel(self:GetPropVirusModel());
			self:SetPropVirusMaxHealth(50);
			self:PhysicsInit(SOLID_VPHYSICS);
			self:SetMoveType(MOVETYPE_VPHYSICS);
			self:SetSolid(SOLID_VPHYSICS);
			local otm_test_phys = self:GetPhysicsObject();
			if (otm_test_phys:IsValid()) then
				otm_test_phys:Wake();
			end
			//Modular Function Variables
			//THINK
			self.think_functions = {};
			self.think_base_enabled = false;
			self.think_additions_enabled = false;
			//HOP
			self.hop_functions = {};
			self.hop_base_enabled = true;
			self.hop_additions_enabled = false;
			//CHARGE
			self.charge_functions = {};
			self.charge_base_enabled = true;
			self.charge_additions_enabled = false;
			//SPAWN
			self.spawn_functions = {};
			self.spawn_base_enabled = true;
			self.spawn_additions_enabled = false;
			//RECEIVE DAMAGE
			self.receive_damage_functions = {};
			self.receive_damage_base_enabled = true;
			self.receive_damage_additions_enabled = false;
			//INFECT
			self.infect_functions = {};
			self.infect_base_enabled = true;
			self.infect_additions_enabled = false;
			//REMOVE
			self.remove_functions = {};
			self.remove_base_enabled = true;
			self.remove_additions_enabled = false;
			//START TOUCH
			self.starttouch_functions = {};
			self.starttouch_base_enabled = true;
			self.starttouch_additions_enabled = false;
			//USE
			self.use_functions = {};
			self.use_base_enabled = true;
			self.use_additions_enabled = false;

			//Other Variables
			self.hop_enabled = true;
			self.hop_timer_delay = 5; 	//Just a number for now, PUT CONVAR HERE
			self.hop_timer = self.hop_timer_delay;

			self.charge_enabled = true;
			self.charge_timer_delay = 10;
			self.charge_timer = self.charge_timer_delay;
			self.otm_prop_virus_rewrite_gib_count = self:PrecacheGibs();
		end
	end

	function ENT:Think()

		//General Thinking Functionality + Additions

		if (self.think_additions_enabled) then
			for _, igig in ipairs(self.think_functions) do
				igig();
			end
		end

		if (self.think_base_enabled) then
			self:otm_base_think_function();
		end

		if (SERVER) then
			//hop and charge functionality
			self.hop_timer = self.hop_timer - 1;
			self.charge_timer = self.charge_timer - 1;
			if (self.hop_timer <= 0) then
				self:otm_pv_hop();
				local otm_ggg = self:GetPropVirusJumpDelayVariance();
				self.hop_timer = self:GetPropVirusJumpDelay() + math.random(-otm_ggg,otm_ggg);
			end

			if (self.charge_timer <= 0) then
				self:otm_pv_charge();
				self.charge_timer = self.charge_timer_delay;	//Put Convar or NetworkVar here as well.
			end
		end
	end

	if (SERVER) then

		function ENT:StartTouch(ent)

			//General StartTouch Functionality + Additions

			if (self.starttouch_additions_enabled) then
				for _, igig in ipairs(self.starttouch_functions) do
					igig();
				end
			end

			if (self.starttouch_base_enabled) then
				self:otm_base_starttouch_function();
			end

		end

		function ENT:OnTakeDamage(dmg)

			//General OnTakeDamage Functionality + Additions

			if (self.receive_damage_additions_enabled) then
				for _, igig in ipairs(self.receive_damage_functions) do
					igig(dmg);
				end
			end

			if (self.receive_damage_base_enabled) then
				self:otm_base_receive_damage_function(dmg);
			end

		end
	end
	
	function ENT:OnRemove()
		//General Removal Functionality + Additions

		if (self.remove_additions_enabled) then
			for _, igig in ipairs(self.remove_functions) do
				igig();
			end
		end

		if (self.remove_base_enabled) then
			self:otm_base_remove_function();
		end

	end
end

if CLIENT then
	function ENT:Draw()
		self.Entity:DrawModel()
	end

	language.Add( 'otm_prop_virus_rewrite_base', 'Prop Virus' )
end

