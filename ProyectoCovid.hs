--Alumno: Alexis Martens.
--Docentes: Araceli Acosta, Dionisio Alonso, Facundo Bustos,  Matías Molina, Kouichi Cruz, Marcos Gomez. 
--Comision: 2 -> docente -> Facundo Bustos.

type Vacunacion = (Int ,String ,String ,Int ,Int)

---- <Jurisdiccion codigo indec, Jurisdiccion nombre, Vacuna nombre, Primera dosis cantidad, Segunda dosis cantidad> ----

-------------------------------------- FUNCIONES↓-----------------------------------------------------------------------------------------------

vacunados1dosistotal :: [Vacunacion]->Int
vacunados1dosistotal [] = 0
vacunados1dosistotal (x:xs) = primera_dosis_cantidad x + vacunados1dosistotal xs 

------------------------------------------------------------------------------------------------------------------------------------------------

vacunados2dosistotal :: [Vacunacion]->Int
vacunados2dosistotal [] = 0
vacunados2dosistotal (x:xs) = segunda_dosis_cantidad x + vacunados2dosistotal xs 

------------------------------------------------------------------------------------------------------------------------------------------------

dosis_objetivo :: [Vacunacion] -> [Int]
dosis_objetivo [] = []
dosis_objetivo (v:vs) = primera_dosis_cantidad v *2 : dosis_objetivo vs 

------------------------------------------------------------------------------------------------------------------------------------------------
pocas_dosis1 :: [Vacunacion]->[Vacunacion]
pocas_dosis1 [] = []
pocas_dosis1 (v:vs) |primera_dosis_cantidad v <= 100 = v:pocas_dosis1 vs
                    |otherwise = pocas_dosis1 vs 

------------------------------------------------------------------------------------------------------------------------------------------------

pocas_dosis2 :: [Vacunacion]->[Vacunacion]
pocas_dosis2 [] = []
pocas_dosis2 (v:vs) |segunda_dosis_cantidad v == 0 = v:pocas_dosis2 vs
                    |otherwise = pocas_dosis2 vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_sputnik :: [Vacunacion]->[Vacunacion]
datos_solo_sputnik [] = []
datos_solo_sputnik (v:vs) | vacuna_nombre v == "Sputnik V COVID19 Instituto Gamaleya" = v:datos_solo_sputnik vs  
                          | otherwise  = datos_solo_sputnik vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_astrazeneca :: [Vacunacion]->[Vacunacion]
datos_solo_astrazeneca [] = []
datos_solo_astrazeneca (v:vs) | vacuna_nombre v == "AstraZeneca ChAdOx1 S recombinante" = v:datos_solo_astrazeneca vs  
                              | otherwise  = datos_solo_astrazeneca vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_moderna :: [Vacunacion]->[Vacunacion]
datos_solo_moderna [] = []
datos_solo_moderna (v:vs) | vacuna_nombre v == "Moderna ARNm" = v:datos_solo_moderna vs  
                          | otherwise  = datos_solo_moderna vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_pzifer :: [Vacunacion]->[Vacunacion]
datos_solo_pzifer [] = []
datos_solo_pzifer (v:vs) | vacuna_nombre v == "Pfizer BioNTech Comirnaty" = v:datos_solo_pzifer vs  
                         | otherwise  = datos_solo_pzifer vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_sinopharm :: [Vacunacion]->[Vacunacion]
datos_solo_sinopharm[]=[]
datos_solo_sinopharm (v:vs) | vacuna_nombre v == "Sinopharm Vacuna SARSCOV 2 inactivada" = v:datos_solo_sinopharm vs  
                            | otherwise  = datos_solo_sinopharm vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_covishild :: [Vacunacion]->[Vacunacion]
datos_solo_covishild [] = []
datos_solo_covishild (v:vs) | vacuna_nombre v == "COVISHIELD ChAdOx1nCoV COVID 19" = v:datos_solo_covishild vs  
                            | otherwise  = datos_solo_covishild vs 

------------------------------------------------------------------------------------------------------------------------------------------------

datos_solo_cansino :: [Vacunacion]->[Vacunacion] 
datos_solo_cansino [] = []
datos_solo_cansino (v:vs) | vacuna_nombre v == "Cansino Ad5 nCoV" = v:datos_solo_cansino vs  
                          | otherwise  = datos_solo_cansino vs 

---------------------------------- PROYECCCIONES↓-----------------------------------------------------------------------------------------------

jurisdiccion_codigo_indec :: (Vacunacion)->(Int)
jurisdiccion_codigo_indec (jurCodInd, jurNombre , nombreVacuna , primeraDosis , segundaDosis) = jurCodInd

------------------------------------------------------------------------------------------------------------------------------------------------

jurisdiccion_nombre :: (Vacunacion)->(String)
jurisdiccion_nombre (jurCodInd, jurNombre , nombreVacuna , primeraDosis , segundaDosis) = jurNombre

------------------------------------------------------------------------------------------------------------------------------------------------

vacuna_nombre :: (Vacunacion)->(String)
vacuna_nombre (jurCodInd, jurNombre , nombreVacuna , primeraDosis , segundaDosis) = nombreVacuna

------------------------------------------------------------------------------------------------------------------------------------------------

primera_dosis_cantidad :: (Vacunacion)->(Int)
primera_dosis_cantidad (jurCodInd, jurNombre , nombreVacuna , primeraDosis , segundaDosis) = primeraDosis

------------------------------------------------------------------------------------------------------------------------------------------------

segunda_dosis_cantidad :: (Vacunacion)->(Int)
segunda_dosis_cantidad (jurCodInd, jurNombre , nombreVacuna , primeraDosis , segundaDosis) = segundaDosis

---------------------------------------------------------------------------------------------------------------------------

base :: [Vacunacion]
base = [(06,"Buenos Aires","AstraZeneca ChAdOx1 S recombinante",3398099,3627326),
 (06,"Buenos Aires","COVISHIELD ChAdOx1nCoV COVID 19",251013,323),
 (06,"Buenos Aires","Cansino Ad5 nCoV",14759,0),
 (06,"Buenos Aires","Moderna ARNm",304141,911407),
 (06,"Buenos Aires","Pfizer BioNTech Comirnaty",239213,0),
 (06,"Buenos Aires","Sinopharm Vacuna SARSCOV 2 inactivada",3847404,3009503),
 (06,"Buenos Aires","Sputnik V COVID19 Instituto Gamaleya",4038729,2244120),
 (02,"CABA","AstraZeneca ChAdOx1 S recombinante",675043,687633),
 (02,"CABA","COVISHIELD ChAdOx1nCoV COVID 19",65223,183),
 (02,"CABA","Cansino Ad5 nCoV",25765,0),
 (02,"CABA","Moderna ARNm",19214,244019),
 (02,"CABA","Pfizer BioNTech Comirnaty",70144,14874),
 (02,"CABA","Sinopharm Vacuna SARSCOV 2 inactivada",689978,634381),
 (02,"CABA","Sputnik V COVID19 Instituto Gamaleya",889361,517218),
 (10,"Catamarca","AstraZeneca ChAdOx1 S recombinante",84831,70885),
 (10,"Catamarca","COVISHIELD ChAdOx1nCoV COVID 19",4751,4),
 (10,"Catamarca","Cansino Ad5 nCoV",1037,0),
 (10,"Catamarca","Moderna ARNm",7015,20073),
 (10,"Catamarca","Pfizer BioNTech Comirnaty",4185,18),
 (10,"Catamarca","Sinopharm Vacuna SARSCOV 2 inactivada",111743,84694),
 (10,"Catamarca","Sputnik V COVID19 Instituto Gamaleya",93873,53853),
 (22,"Chaco","AstraZeneca ChAdOx1 S recombinante",225915,174923),
 (22,"Chaco","COVISHIELD ChAdOx1nCoV COVID 19",15356,601),
 (22,"Chaco","Cansino Ad5 nCoV",353,0),
 (22,"Chaco","Moderna ARNm",24228,48596),
 (22,"Chaco","Pfizer BioNTech Comirnaty",7611,382),
 (22,"Chaco","Sinopharm Vacuna SARSCOV 2 inactivada",227441,148358),
 (22,"Chaco","Sputnik V COVID19 Instituto Gamaleya",240471,130735),
 (26,"Chubut","AstraZeneca ChAdOx1 S recombinante",120595,108530),
 (26,"Chubut","COVISHIELD ChAdOx1nCoV COVID 19",11741,617),
 (26,"Chubut","Cansino Ad5 nCoV",43,0),
 (26,"Chubut","Moderna ARNm",17020,24328),
 (26,"Chubut","Pfizer BioNTech Comirnaty",4984,15),
 (26,"Chubut","Sinopharm Vacuna SARSCOV 2 inactivada",108761,81924),
 (26,"Chubut","Sputnik V COVID19 Instituto Gamaleya",131400,76332),
 (18,"Corrientes","AstraZeneca ChAdOx1 S recombinante",174800,138236),
 (18,"Corrientes","COVISHIELD ChAdOx1nCoV COVID 19",19700,397),
 (18,"Corrientes","Cansino Ad5 nCoV",2809,0),
 (18,"Corrientes","Moderna ARNm",24456,49810),
 (18,"Corrientes","Pfizer BioNTech Comirnaty",7922,813),
 (18,"Corrientes","Sinopharm Vacuna SARSCOV 2 inactivada",269355,175250),
 (18,"Corrientes","Sputnik V COVID19 Instituto Gamaleya",247384,118223),
 (14,"Córdoba","AstraZeneca ChAdOx1 S recombinante",766348,732419),
 (14,"Córdoba","COVISHIELD ChAdOx1nCoV COVID 19",43868,78),
 (14,"Córdoba","Cansino Ad5 nCoV",7206,0),
 (14,"Córdoba","Moderna ARNm",40833,229899),
 (14,"Córdoba","Pfizer BioNTech Comirnaty",58265,4040),
 (14,"Córdoba","Sinopharm Vacuna SARSCOV 2 inactivada",852368,680325),
 (14,"Córdoba","Sputnik V COVID19 Instituto Gamaleya",877852,486496),
 (30,"Entre Ríos","AstraZeneca ChAdOx1 S recombinante",272795,224856),
 (30,"Entre Ríos","COVISHIELD ChAdOx1nCoV COVID 19",17205,330),
 (30,"Entre Ríos","Cansino Ad5 nCoV",4514,0),
 (30,"Entre Ríos","Moderna ARNm",17748,65080),
 (30,"Entre Ríos","Pfizer BioNTech Comirnaty",8392,6),
 (30,"Entre Ríos","Sinopharm Vacuna SARSCOV 2 inactivada",295214,234209),
 (30,"Entre Ríos","Sputnik V COVID19 Instituto Gamaleya",300322,149473),
 (34,"Formosa","AstraZeneca ChAdOx1 S recombinante",117399,124382),
 (34,"Formosa","COVISHIELD ChAdOx1nCoV COVID 19",7347,1),
 (34,"Formosa","Cansino Ad5 nCoV",253,0),
 (34,"Formosa","Moderna ARNm",38764,4716),
 (34,"Formosa","Pfizer BioNTech Comirnaty",6261,1),
 (34,"Formosa","Sinopharm Vacuna SARSCOV 2 inactivada",167090,115209),
 (34,"Formosa","Sputnik V COVID19 Instituto Gamaleya",130477,68742),
 (38,"Jujuy","AstraZeneca ChAdOx1 S recombinante",160057,126702),
 (38,"Jujuy","COVISHIELD ChAdOx1nCoV COVID 19",13972,286),
 (38,"Jujuy","Cansino Ad5 nCoV",26,0),
 (38,"Jujuy","Moderna ARNm",20241,20542),
 (38,"Jujuy","Pfizer BioNTech Comirnaty",7680,33),
 (38,"Jujuy","Sinopharm Vacuna SARSCOV 2 inactivada",174959,108548),
 (38,"Jujuy","Sputnik V COVID19 Instituto Gamaleya",152607,100963),
 (42,"La Pampa","AstraZeneca ChAdOx1 S recombinante",67224,72710),
 (42,"La Pampa","COVISHIELD ChAdOx1nCoV COVID 19",4572,0),
 (42,"La Pampa","Cansino Ad5 nCoV",2446,0),
 (42,"La Pampa","Moderna ARNm",4848,23977),
 (42,"La Pampa","Pfizer BioNTech Comirnaty",14428,477),
 (42,"La Pampa","Sinopharm Vacuna SARSCOV 2 inactivada",102546,77940),
 (42,"La Pampa","Sputnik V COVID19 Instituto Gamaleya",86302,47971),
 (46,"La Rioja","AstraZeneca ChAdOx1 S recombinante",75070,69869),
 (46,"La Rioja","COVISHIELD ChAdOx1nCoV COVID 19",7204,108),
 (46,"La Rioja","Cansino Ad5 nCoV",1836,0),
 (46,"La Rioja","Moderna ARNm",8934,23284),
 (46,"La Rioja","Pfizer BioNTech Comirnaty",9037,71),
 (46,"La Rioja","Sinopharm Vacuna SARSCOV 2 inactivada",96589,73002),
 (46,"La Rioja","Sputnik V COVID19 Instituto Gamaleya",92565,54796),
 (50,"Mendoza","AstraZeneca ChAdOx1 S recombinante",402459,353848),
 (50,"Mendoza","COVISHIELD ChAdOx1nCoV COVID 19",25215,407),
 (50,"Mendoza","Cansino Ad5 nCoV",2614,0),
 (50,"Mendoza","Moderna ARNm",22799,123427),
 (50,"Mendoza","Pfizer BioNTech Comirnaty",47990,248),
 (50,"Mendoza","Sinopharm Vacuna SARSCOV 2 inactivada",356616,281666),
 (50,"Mendoza","Sputnik V COVID19 Instituto Gamaleya",450490,240360),
 (54,"Misiones","AstraZeneca ChAdOx1 S recombinante",209222,197400),
 (54,"Misiones","COVISHIELD ChAdOx1nCoV COVID 19",16645,790),
 (54,"Misiones","Cansino Ad5 nCoV",2092,0),
 (54,"Misiones","Moderna ARNm",36798,43836),
 (54,"Misiones","Pfizer BioNTech Comirnaty",9762,44),
 (54,"Misiones","Sinopharm Vacuna SARSCOV 2 inactivada",196184,122571),
 (54,"Misiones","Sputnik V COVID19 Instituto Gamaleya",233168,117848),
 (58,"Neuquén","AstraZeneca ChAdOx1 S recombinante",137348,118946),
 (58,"Neuquén","COVISHIELD ChAdOx1nCoV COVID 19",12770,58),
 (58,"Neuquén","Cansino Ad5 nCoV",4418,0),
 (58,"Neuquén","Moderna ARNm",11432,35681),
 (58,"Neuquén","Pfizer BioNTech Comirnaty",16349,10),
 (58,"Neuquén","Sinopharm Vacuna SARSCOV 2 inactivada",156026,117455),
 (58,"Neuquén","Sputnik V COVID19 Instituto Gamaleya",155284,88528),
 (62,"Río Negro","AstraZeneca ChAdOx1 S recombinante",140828,137144),
 (62,"Río Negro","COVISHIELD ChAdOx1nCoV COVID 19",13964,89),
 (62,"Río Negro","Cansino Ad5 nCoV",1108,0),
 (62,"Río Negro","Moderna ARNm",8632,43538),
 (62,"Río Negro","Pfizer BioNTech Comirnaty",18617,75),
 (62,"Río Negro","Sinopharm Vacuna SARSCOV 2 inactivada",199259,146792),
 (62,"Río Negro","Sputnik V COVID19 Instituto Gamaleya",168573,89364),
 (66,"Salta","AstraZeneca ChAdOx1 S recombinante",297774,225951),
 (66,"Salta","COVISHIELD ChAdOx1nCoV COVID 19",17838,52),
 (66,"Salta","Cansino Ad5 nCoV",144,0),
 (66,"Salta","Moderna ARNm",19071,63680),
 (66,"Salta","Pfizer BioNTech Comirnaty",15269,762),
 (66,"Salta","Sinopharm Vacuna SARSCOV 2 inactivada",228660,140557),
 (66,"Salta","Sputnik V COVID19 Instituto Gamaleya",290464,160973),
 (70,"San Juan","AstraZeneca ChAdOx1 S recombinante",145537,145232),
 (70,"San Juan","COVISHIELD ChAdOx1nCoV COVID 19",8811,12),
 (70,"San Juan","Cansino Ad5 nCoV",72,0),
 (70,"San Juan","Moderna ARNm",12808,37024),
 (70,"San Juan","Pfizer BioNTech Comirnaty",13970,25),
 (70,"San Juan","Sinopharm Vacuna SARSCOV 2 inactivada",157510,133892),
 (70,"San Juan","Sputnik V COVID19 Instituto Gamaleya",191981,99454),
 (74,"San Luis","AstraZeneca ChAdOx1 S recombinante",97589,103580),
 (74,"San Luis","COVISHIELD ChAdOx1nCoV COVID 19",6829,0),
 (74,"San Luis","Cansino Ad5 nCoV",3949,0),
 (74,"San Luis","Moderna ARNm",8770,28046),
 (74,"San Luis","Pfizer BioNTech Comirnaty",16760,396),
 (74,"San Luis","Sinopharm Vacuna SARSCOV 2 inactivada",124754,101752),
 (74,"San Luis","Sputnik V COVID19 Instituto Gamaleya",120157,74789),
 (78,"Santa Cruz","AstraZeneca ChAdOx1 S recombinante",59023,53195),
 (78,"Santa Cruz","COVISHIELD ChAdOx1nCoV COVID 19",5912,713),
 (78,"Santa Cruz","Cansino Ad5 nCoV",1140,0),
 (78,"Santa Cruz","Moderna ARNm",8278,13333),
 (78,"Santa Cruz","Pfizer BioNTech Comirnaty",4594,65),
 (78,"Santa Cruz","Sinopharm Vacuna SARSCOV 2 inactivada",60551,50764),
 (78,"Santa Cruz","Sputnik V COVID19 Instituto Gamaleya",86259,52839),
 (82,"Santa Fe","AstraZeneca ChAdOx1 S recombinante",743091,707282),
 (82,"Santa Fe","COVISHIELD ChAdOx1nCoV COVID 19",41234,52),
 (82,"Santa Fe","Cansino Ad5 nCoV",6089,0),
 (82,"Santa Fe","Moderna ARNm",29392,222023),
 (82,"Santa Fe","Pfizer BioNTech Comirnaty",44457,16),
 (82,"Santa Fe","Sinopharm Vacuna SARSCOV 2 inactivada",777038,657989),
 (82,"Santa Fe","Sputnik V COVID19 Instituto Gamaleya",864940,477094),
 (86,"Santiago del Estero","AstraZeneca ChAdOx1 S recombinante",204262,188910),
 (86,"Santiago del Estero","COVISHIELD ChAdOx1nCoV COVID 19",11848,1161),
 (86,"Santiago del Estero","Cansino Ad5 nCoV",4965,0),
 (86,"Santiago del Estero","Moderna ARNm",7178,61485),
 (86,"Santiago del Estero","Pfizer BioNTech Comirnaty",26109,103),
 (86,"Santiago del Estero","Sinopharm Vacuna SARSCOV 2 inactivada",249922,198743),
 (86,"Santiago del Estero","Sputnik V COVID19 Instituto Gamaleya",216671,116782),
 (94,"Tierra del Fuego","AstraZeneca ChAdOx1 S recombinante",32301,31930),
 (94,"Tierra del Fuego","COVISHIELD ChAdOx1nCoV COVID 19",2726,750),
 (94,"Tierra del Fuego","Moderna ARNm",1758,10757),
 (94,"Tierra del Fuego","Pfizer BioNTech Comirnaty",6079,30),
 (94,"Tierra del Fuego","Sinopharm Vacuna SARSCOV 2 inactivada",38521,31879),
 (94,"Tierra del Fuego","Sputnik V COVID19 Instituto Gamaleya",43495,24405),
 (90,"Tucumán","AstraZeneca ChAdOx1 S recombinante",293721,274178),
 (90,"Tucumán","COVISHIELD ChAdOx1nCoV COVID 19",20536,57),
 (90,"Tucumán","Moderna ARNm",30430,73036), 
 (90,"Tucumán","Pfizer BioNTech Comirnaty",31733,0),
 (90,"Tucumán","Sinopharm Vacuna SARSCOV 2 inactivada",327583,251635), 
 (90,"Tucumán","Sputnik V COVID19 Instituto Gamaleya",393630,203913)];