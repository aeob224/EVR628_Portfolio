# EVR628_Portfolio

This is Aidan O'Brien's repository for EVR 628.

This project deals with the federally endangered Santa Cruz Long-toed salamander (SCLTS). The intent is to assess if there is any relationship between prey abundance or larval salamander density and SCLTS larval body condition.

![Link to final report.](final_report.html)

## Repository Folders:

#### data

Contains subfolders for raw, processed, and output datasets.

#### results

Contains figure images

#### scripts

Contains three subfolders for scripts that process, analyze, or visualize data

## Metadata:

#### morphometric_variables

Raw dataset containing data on each individual salamander larva captured during the duration of the study. This is necessary to calculate body conditions.

pond: Pond where individual was captured

date: Date of the survey

method: Method by which larva was captured. Meaning of most of these codes is defined in the html document attached to this file.

effort: Total effort conducted in the survey. Please note that this is NOT the effort required to capture the single individual but rather the total effort exerted for that survey.

species: Species of salamander captured.

mass: Mass in grams

svl: Snout to vent length of the larva in mm

tl: Total length of the larva in mm

age/sex: Life stage of the individual

development: Only for larvae. Can be 1, 2, 3, or 4 to signify how close an individual is to metamorphosis. 1 indicates no metamorphosis is occurring. 2 indicates some dorsal fin absorption. 3 indicates dorsal fin absorption past halfway down the back. 4 Indicates individual is essentially fully metamorphosed and could leave pond at any time.

genetic: Were tail clips taken from the individual (1 indicates yes; 0 indicates no)

year: Year in which larva was sampled.

### coordinates

Contains localities of all sampled ponds

lat: Latitude

lon: Longitude

pond: Pond name

breeding_pond: Whether or not SCLTS larvae were detected in the pond at any point between 2021 and 2024. 1 indicates yes. 0 indicates no.

distance_to_nearest_breeding_pond: Distance in meters to the nearest other pond with SCLTS detected in it between 2021 and 2024.

### aquatic_variables

This is the raw dataset of aquatic habitat parameters that are half of the data used to create the tidy dataset for analysis.

pond: The pond where measurements were obtained

year: Year of survey

larv_density: The density of SCLTS larvae in larvae/m\^2

med_prey: Total number of chironomids, ghost midges, and amphipods found in 4 plankton tows

large_prey: Combined density of chorus frog tadpoles, planorbid snails, physid snails, backswimmers, and waterboatmen (#/m\^2)

vert_pred: Combined density of newt larvae, newt adults, sticklebacks, sculpins, gambusia, and CTS (vertebrate predators/m\^2)

invert_pred: Combined density of crawfish, dytiscids, anisoptera, belostomatids, and damselfly larvae (invertebrates/m\^2)

plankton: Total number of plankton from 4 tow hauls

water_temp: Temperature of the pond (Celsius)

DO: Dissolved oxygen concentration (mg/L)

nitrates: Nitrate concentration

pH: pH of the pond

salinity: Salinity of the pond (parts per thousand)

chlorophyll: Chlorophyll concentration in the pond (parts per billion)

turbidity: Turbidity of the pond (NTU)

emergent_veg: Percent of pond surface with emergent vegetation

conductivity: Pond conductivity

depth: Pond depth at sampling (cm)

dist_to_breed: Distance to the nearest pond with larvae

per_suitable_hab: Percent of terrestrial habitat within 598m of a pond that is viable for juvenile and adult SCLTS

suitable_598_split: Amount of upland habitat that is viable for SCLTS within 598m after accounting for barrier roads (m\^2)

suitable_598: Amount of upland habitat that is viable for SCLTS within 598m (m\^2; does not account for roads)

### tidy_data

This is the processed dataset used to conduct most visualizations and analyses.

pond_year: The year and pond where measurements were obtained

body_condition: Mean body condition of SCLTS larvae at the site. Calculated as the average residuals of log(mass) vs. log(SVL)

larv_density: The density of SCLTS larvae in larvae/m\^2

med_prey: Total number of chironomids, ghost midges, and amphipods found in 4 plankton tows

large_prey: Combined density of chorus frog tadpoles, planorbid snails, physid snails, backswimmers, and waterboatmen (#/m\^2)

vert_pred: Combined density of newt larvae, newt adults, sticklebacks, sculpins, gambusia, and CTS (vertebrate predators/m\^2)

invert_pred: Combined density of crawfish, dytiscids, anisoptera, belostomatids, and damselfly larvae (invertebrates/m\^2)

plankton: Total number of plankton from 4 tow hauls

water_temp: Temperature of the pond (Celsius)

DO: Dissolved oxygen concentration (mg/L)

nitrates: Nitrate concentration

pH: pH of the pond

salinity: Salinity of the pond (parts per thousand)

chlorophyll: Chlorophyll concentration in the pond (parts per billion)

turbidity: Turbidity of the pond (NTU)

emergent_veg: Percent of pond surface with emergent vegetation

conductivity: Pond conductivity

depth: Pond depth at sampling (cm)

dist_to_breed: Distance to the nearest pond with larvae

per_suitable_hab: Percent of terrestrial habitat within 598m of a pond that is viable for juvenile and adult SCLTS

suitable_598_split: Amount of upland habitat that is viable for SCLTS within 598m after accounting for barrier roads (m\^2)

suitable_598: Amount of upland habitat that is viable for SCLTS within 598m (m\^2; does not account for roads)

#### 
