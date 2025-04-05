-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
  
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="Grioavolr",
		sub="Clerisy strap",
		ammo="Impatiens",
		head="Ebers cap +2",
		neck="Cleric's torque",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		body="Inyanga jubbah +2",
		hands="Gendewitha gages +1",
		ring1="Kishar ring",
		ring2="Veneficium ring",
		back="Perimede Cape",
		waist="Witful Belt",
		legs="Ayanmo cosciales +2",
		feet="Regal pumps"}
       
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
		
		
    sets.precast.Stoneskin = set_combine(sets.precast.FC, {waist="Siegel Sash", head="Umuthi hat", legs = "Doyen pants",})
		
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
	ear1="Nourish. earring", 
	ear2="Nourish. earring +1", 
	legs="Ebers pantaloons +3",
	feet="Regal pumps",})
	
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = {
		main="Grioavolr",
		sub="Clerisy strap",
		ammo="Staunch tathlum",
		head="Ebers cap +2",
		neck="Cleric's torque",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		body="Inyanga jubbah +2",
		hands="Gendewitha gages +1",
		ring1="Kishar ring",
		ring2="Veneficium ring",
		back="Alaunus's Cape",
		waist="Witful Belt",
		legs="Bunzi's pants",
		feet="Regal pumps"}
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure

    -- CureMelee spell map should default back to Healing Magic.
   
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Theophany Briault +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Ebers cap +2",ear1="Roundel Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
   
  
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Grunfeld Rope"
    sets.precast.WS = {
        head="Ayanmo zucchetto +2",
		neck=gear.ElementalGorget,
		ear1="Regal Earring",
		ear2="Ishvara Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo manopolas +1",
		ring1="Petrov Ring",
		ring2="Hetairoi Ring",
        back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist=gear.ElementalBelt,
		legs="Ayanmo cosciales +2",
		feet="Theophany Duckbills +3"}
    
    sets.precast.WS['Flash Nova'] = {
    ammo="Hydrocera",
    head={ name="Chironic Hat", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Cure" potency +3%','Mag. Acc.+6','"Mag.Atk.Bns."+15',}},
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Cure" potency +3%','MND+4','"Mag.Atk.Bns."+5',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+3','INT+6','"Mag.Atk.Bns."+11',}},
    feet="Theo. Duckbills +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Strendu Ring",
    right_ring="Karieyh Ring",
    back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}} 
		
	sets.precast.WS['Realmrazer'] = {
		head="Ayanmo zuchetto +2",
		neck="Flame gorget",
		ear1="Regal Earring",
		ear2="Ishvara Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo manopolas +1",
		ring1="Petrov Ring",
		ring2="Hetairoi Ring",
        back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Grunfeld rope",
		legs="Ayanmo cosciales +2",
		feet="Theophany Duckbills +3"}
		
	sets.precast.WS['Hexa Strike'] = {
		head="Ayanmo zuchetto +2",
		neck="Flame gorget",
		ear1="Regal Earring",
		ear2="Ishvara Earring",
        body="Piety briault +3",
		hands="Ayanmo manopolas +1",
		ring1="Petrov Ring",
		ring2="Hetairoi Ring",
		back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Grunfeld rope",
		legs="Ayanmo cosciales +2",
		feet="Theophany Duckbills +3"}
		
		sets.precast.WS['Seraph Strike'] = {
		    ammo="Hydrocera",
    head={ name="Chironic Hat", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Cure" potency +3%','Mag. Acc.+6','"Mag.Atk.Bns."+15',}},
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Cure" potency +3%','MND+4','"Mag.Atk.Bns."+5',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+3','INT+6','"Mag.Atk.Bns."+11',}},
    feet="Theo. Duckbills +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Strendu Ring",
    right_ring="Karieyh Ring",
    back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
		
	sets.precast.WS['Black Halo'] ={
	ammo="Hydrocera",
    head="Aya. Zucchetto +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +1",
    legs={ name="Piety Pantaln. +2", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Aya. Gambieras +2",
    neck="Cleric's Torque",
    waist="Breeze Belt",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Ilabrat Ring",
    back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
    -- Midcast Sets
 
    sets.midcast.FastRecast = {
		main="Grioavolr",
		sub="Clerisy strap",
        head="Ebers cap +2",
		ear1="Loquacious Earring",
		ear2="Malignance earring",
        body="Inyanga jubbah +2",
		hands="Gendewitha gages +1",
		ring1="Kishar Ring",
		ring2="Veneficium Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Witful Belt",
		legs="Ayanmo cosciales +2",
		feet="Regal pumps"}
    
    -- Cure sets
    gear.default.obi_waist = "Luminary Sash"
    gear.default.obi_back = "Alaunus's cape"
	
    sets.midcast.CureSolace = {
		main="Queller rod",
		sub="genmei shield",
		ammo="Pemphredo tathlum",
		head="Vanya hood",
		neck="Cleric's torque",
		ear1="Nourishing Earring +1",
		ear2="Ebers earring",
		body="Ebers bliaut +3",
		hands="Theophany mitts +3",
		ring1="Naji's loop",
		ring2="Kuchekula Ring",
		waist="Luminary sash",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		legs="Ebers Pantaloons +3",
		feet="Kaykaus boots"}

    sets.midcast.Cure = {
		main="Queller rod",
		sub="genmei shield",
		ammo="Pemphredo tathlum",
		head="Vanya hood",
		neck="Cleric's torque",
		ear1="Nourishing Earring +1",
		ear2="Ebers earring",
		body="Ebers bliaut +3",
		hands="Theophany mitts +3",
		ring1="Naji's loop",
		ring2="Kuchekula Ring",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Luminary sash",
		legs="Ebers Pantaloons +3",
		feet="Kaykaus boots"}

		sets.midcast.WeatherCure = {
			main="Chatoyant staff",
		sub="Clerisy strap",
		ammo="Pemphredo tathlum",
		head="Vanya hood",
		neck="Cleric's torque",
		ear1="Nourishing Earring +1",
		ear2="Ebers earring",
		body="Ebers bliaut +3",
		hands="Theophany mitts +3",
		ring1="Zodiac ring",
		ring2="Kuchekula Ring",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Hachirin-no-Obi",
		legs="Ebers Pantaloons +3",
		feet="Kaykaus boots"
		}

    sets.midcast.Curaga = {
		main="Queller rod",
		sub="genmei shield",
		ammo="Hydrocera",
		head="Vanya hood",
		neck="Cleric's torque",
		ear1="Nourishing Earring +1",
		ear2="Ebers earring",
		body="Theo. Bliaut +3",
		hands="Theophany mitts +3",
		ring1="Naji's loop",
		ring2="Kuchekula Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Hacirin-no-obi",
		legs="Ebers Pantaloons +3",
		feet="Kaykaus boots"}

    sets.midcast.CureMelee = {
		main="Queller Rod",
		sub="Sors Shield",
		ammo="Cleric's stone",
		head="Vanya hood",
		neck="Cleric's torque",
		ear1="Nourishing Earring",
		ear2="Nourishing Earring +1",
		body="Ebers bliaud +2",
		hands="Theophany mitts +3",
		ring1="Kishar Ring",
		ring2="Kuchekula Ring",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Hachirin-no-obi",
		legs="Ebers Pantaloons +3",
		feet="Kaykaus boots"}

    sets.midcast.Cursna = {
		main="Grioavolr staff",
		sub="Clerisy strap",
		ammo="Impatiens",
		head="Ebers cap +2",
		neck="Malison Medallion",
		body="Ebers Bliaud +2",
		hands="Fanatic gloves",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		ear1="loquacious earring",
		ear2="Etiolation Earring",
		waist="Witful Belt",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		legs="Theophany pantaloons +3",
		feet="Vanya clogs"}

    sets.midcast.StatusRemoval = {
        main="Grioavolr",
		sub="Clerisy strap",
		head="Ebers cap +2",
		body="Ebers Bliaud +2",
		neck="Cleric's torque",
		hands="ebers mitts +2",
		ear1="loquacious earring",
		ear2="Etiolation Earring",
		ring1="Kuchekula Ring",
		ring2="Sirona's Ring",
		legs="Ebers Pantaloons +3",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		feet="Chironic slippers"}
		
		sets.midcast.Erase = {
		main="Grioavolr",
		neck="Cleric's torque",
		sub="Clerisy strap",
        head="Ebers cap +2",
		ear1="Loquacious Earring",
		ear2="Malignance earring",
        body="Inyanga jubbah +2",
		hands="Gendewitha gages +1",
		ring1="Kishar Ring",
		ring2="Veneficium Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Witful Belt",
		legs="Ayanmo cosciales +2",
		feet="Regal pumps"}

	sets.midcast['Enhancing'] = {
		main="Gada",
	sub="Ammurapi Shield",
	neck="Cleric's torque",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	ear1="Loquacious earring",
	ear2="Malignance earring",
	ring1="Kishar Ring",
		ring2="Kuchekula Ring",
	waist="Embla Sash",
	back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	legs="Telchine Braconi",
	feet="Theophany duckbills +3"
	}

	sets.midcast.Storm = {
		main="Gada",
	sub="Ammurapi Shield",
	neck="Cleric's torque",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	ear1="Loquacious earring",
	ear2="Malignance earring",
	ring1="Kishar Ring",
	ring2="Kuchekula Ring",
	waist="Embla Sash",
	back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	legs="Telchine Braconi",
	feet="Theophany duckbills +3"
	}
    -- 110 total Enhancing Magic Skill; caps even without Light Arts

	sets.midcast.BarStatus = {
		main="Gada",
	sub="Ammurapi Shield",
	neck="Sroda necklace",
	head="Telchine Cap",
	body="Telchine Chas.",
	hands="Telchine Gloves",
	ear1="Loquacious earring",
	ear2="Malignance earring",
	waist="Embla Sash",
	back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	legs="Telchine Braconi",
	feet="Theophany duckbills +3"}

    sets.midcast.Stoneskin = {
		main= "Cath palug hammer",
		sub="Ammurapi Shield",
		range="Cleric's Stone",
    	head="Umuthi hat",
		neck="Nodens gorget",
		ear1="Andoaa Earring",
		ear2="Earthcry Earring",
		body="Inyanga jubbah +2",
		hands="Telchine gloves",
		back="Solemnity Cape",
		waist="Siegel Sash",
		legs="Shedir seraweels",
		feet="theophany duckbills +3"}
		
	sets.midcast.Aquaveil = {
		main="vadose rod",
			sub="Ammurapi Shield",
		neck="Cleric's Torque",
		head="Chironic hat",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ear1="Loquacious earring",
		waist="Olympus Sash",
		legs="Shedir seraweels",
		feet="Theophany duckbills +3",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	}
		
	sets.midcast.Haste = {
		main="Gada",
		sub="Ammurapi Shield",
		neck="Cleric's Torque",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Theophany duckbills +3",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	}

    sets.midcast.BarElement = {
		main="Beneficus",
		sub="Ammurapi Shield",
        head="Ebers cap +2",
		neck="Cleric's torque",
		ear1="Andoaa Earring",
		body="Ebers bliaut +3",
		hands="ebers mitts +2",
	    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Embla sash",
		legs="Piety Pantaloons +2",
		feet="Ebers duckbills +3"}

    sets.midcast.Regen = {
		 main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Pemphredo tathlum",
		head="Inyanga Tiara +2",
		body="Piety bliaut +3",
		hands="ebers mitts +2",
		legs="Theophany pantaloons +3",
		feet="Bunzi's sabots",
		neck="Cleric's torque",
		waist="Pythia Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Kuchekula Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}}

	sets.midcast.Auspice = {
		main="Gada",
		sub="Ammurapi Shield",
		neck="Cleric's Torque",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Ebers duckbills +3",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	}

    sets.midcast.Protectra = {
		main="Gada",
		sub="Ammurapi Shield",
		neck="Cleric's Torque",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Theophany duckbills +3",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}}}
	
    sets.midcast.Shellra = {
		main="Gada",
		sub="Ammurapi Shield",
		neck="Cleric's Torque",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ear1="Loquacious earring",
		ear2="Malignance earring",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Theophany duckbills +3",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}}}
	
    sets.midcast['Banish'] = {
		main="Mes'yohi rod",
		sub="Ammurapi shield",
		head="Ipoca beret",
		ammo="Pemphredo tathlum",
			neck="Baetyl pendant",
			ear1="Regal earring",
			ear2="Malignance earring",
			body="Nyame mail",
			hands="Fanatic gloves",
			ring1="Crepuscular Ring",
			ring2="Kishar Ring",
			back="Alaunus's cape",
			waist="Hachirin-no-obi",
			legs="Bunzi's pants",
			feet="Nyame sollerets"}

		sets.midcast['Holy'] = {
			main="Daybreak",
			sub="Ammurapi shield",
			head="Nyame helm",
			ammo="Pemphredo tathlum",
			neck="Baetyl pendant",
			ear1="Regal earring",
			ear2="Malignance earring",
			body="Nyame mail",
			hands="Nyame gauntlets",
			ring1="Crepuscular Ring",
			ring2="Kishar Ring",
			back="Alaunus's cape",
			waist="Hachirin-no-obi",
			legs="Bunzi's pants",
			feet="Nyame sollerets"}

		sets.midcast['Repose'] = {
			main="Daybreak",
			sub="Ammurapi shield",
			head="Inyanga tiara +2",
			ammo="Quartz Tathlum +1",
			neck="Imbodia Necklace",
			ear1="Lempo Earring",
			ear2="Nourishing Earring +1",
			body="Inyanga jubbah +2",
			hands="Inyanga dastanas +2",
			ring1="Inyanga Ring",
			ring2="Vertigo Ring",
			back="Alaunus's cape",
			waist="Hachirin-no-obi",
			legs="inyanga shalwar +2",
			feet="Ayanmo gambieras +2"}

    sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Genmei Shield",
		ammo="Quartz Tathlum +1",
		head="Vanya Hood",
		neck="Cleric's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
		body="Inyanga Jubbah +2",
		hands="Helios Gloves",
		ring1="Evanescence Ring",
		ring2="Sangoma Ring",
		back="Gwyddion's Cape",
		waist="Casso Sash",
		legs="Chironic Hose",
		feet="Inyanga Crackows +2"}

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Daybreak",
		sub="Ammurapi shield",
		head="Null masuqe",
		ammo="Hydrocera",
		neck="Null loop",
		ear1="Regal Earring",
		ear2="Malignance earring",
		body="Theophany bliaut +3",
		hands="Inyanga dastanas +2",
		ring1="Crepuscular Ring",
		ring2="Kishar Ring",
	    back="Null shawl",
		waist="Luminary sash",
		legs="Chironic hose",
		feet="theophany duckbills +3"}

    sets.midcast.IntEnfeebles = {
		main="Daybreak",
		sub="Ammurapi shield",
		head="Null masuqe",
		ammo="Pemphredo tathlum",
		neck="Null loop",
		ear1="Regal Earring",
		ear2="Malignance earring",
		body="Theophany bliaut +3",
		hands="Inyanga dastanas +2",
		ring1="Crepuscular Ring",
		ring2="Kishar Ring",
	    back="Null shawl",
		waist="Luminary sash",
		legs="Chironic hose",
		feet="theophany duckbills +3"}
   
    -- Sets to return to when not performing an action.
   
    -- Resting sets
    sets.resting = {
		main="Contemplator +1",
		sub="Giuoco Grip",
		ammo="Homiliary",
		head="Goliard Chapeau",
		neck="Eidolon pendant +1",
		ear1="Glorious Earring",
		ear2="Mendicant's Earring",
		body="Ebers Bliaud +1",
		hands="Nares Cuffs",
		ring1="Kuchekula Ring",
		ring2="Sangoma Ring",
		back="Solemnity cape",
		waist="Shinjutsu-no-Obi +1",
		legs="Assiduity pants +1",
		feet="Chelona Boots"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		main="Mpaca's staff",
		sub="Enki strap",
		ammo="Homiliary",
		head="Chironic hat",
		neck="Bathy choker",
		ear1="Etiolation Earring",
		ear2="Ethereal earring",
		body="Theophany bliaut +3",
		hands="Chironic gloves",
		ring1="Inyanga ring",
		ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
		waist="Embla Sash",
		legs="Assiduity pants +1",
		feet="Inyanga crackows +2"}

    sets.idle.PDT = {
		main="Mpaca's Staff",
    sub="Enki Strap",
    ammo="Homiliary",
    head="Null Masque",
    body="Ebers bliaut +3",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Enmity-1','"Refresh"+2',}},
    legs="Ebers Pant. +3",
    feet="Ebers duckbills +3",
    neck="Sibyl scarf",
    waist="Carrier's sash",
    left_ear="Ethereal Earring",
    right_ear="Etiolation Earring",
    left_ring="Warden's ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
	}

    sets.idle.Town = {
		main="Mpaca's staff",
		sub="Enki strap",
		ammo="Homiliary",
		head="Inyanga tiara +2",
		neck="Bathy choker",
		ear1="Etiolation Earring",
		ear2="Ethereal earring",
		body="Theophany bliaut +3",
		hands="Inyanga dastanas +2",
		ring1="Inyanga ring",
		ring2="Defending Ring",
		back="Null shawl",
		waist="Fucho-no-obi",
		legs="Assiduity pants +1",
		feet="Inyanga crackows +2"}

    
    sets.idle.Weak = {
		main="Mpaca's Staff",
    sub="Enki Strap",
    ammo="Homiliary",
    head="Null Masque",
    body="Ebers bliaut +3",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Enmity-1','"Refresh"+2',}},
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck="Null Loop",
    waist="Embla Sash",
    left_ear="Ethereal Earring",
    right_ear="Etiolation Earring",
    left_ring={ name="Dark Ring", augments={'Enemy crit. hit rate -3','Magic dmg. taken -5%','Phys. dmg. taken -5%',}},
    right_ring="Defending Ring",
    back="Null Shawl",}
    
    -- Defense sets

    sets.defense.PDT = {
		main="Bolelabunga",
		sub="Genmei shield",
		ammo="Staunch tathlum",
		head="Nyame helm",
		neck="Bathy choker",
		ear1="Ethereal Earring",
		ear2="Etiolation Earring",
		body="Nyame mail",
		hands="Nyame gauntlets",
	    left_ring="Paguroidea ring",
		ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Carrier's sash",
		legs="Bunzi's pants",
		feet="Nyame sollerets"}

    sets.defense.MDT = {
		main="Daybreak",
		sub="Genmei shield",
		ammo="Staunch tathlum",
		head="Nyame helm",
		neck="Warder's charm +1",
		ear1="Ethereal Earring",
		ear2="Etiolation Earring",
		body="Nyame mail",
		hands="Nyame gauntlets",
	    left_ring="Inyanga ring",
		ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Carrier's sash",
		legs="Bunzi's pants",
		feet="Nyame sollerets"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		ammo="Staunch tathlum",
		head="Ayanmo zucchetto +2",
		neck="Clotharius torque",
		ear1="Crepuscular earring",
		ear2="Telos Earring",
		body="Ayanmo Corazza +2",
		hands="Nyame gauntlets",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
		back="Null shawl",
		waist="Windbuffet belt +1",
		legs="Ayanmo cosciales +2",
		feet="Ayanmo gambieras +2"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="ebers mitts +2",back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end

	if spell.english == "Auspice" then
		equip(sets.midcast.Auspice)
	end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
    else
        gear.default.obi_back = "Perimede Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end

	if buffactive['Aurorastorm'] or world.day_element == 'Light' and spell.english:sub(1,3) == 'Cur' then
        equip(sets.midcast.WeatherCure)
    end  
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)
end

