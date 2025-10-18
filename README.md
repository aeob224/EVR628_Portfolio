# EVR628_Portfolio
This is Aidan O'Brien's repository for EVR 628.

This project deals with he federally endangered Santa Cruz Long-toed salamander (SCLTS).
The intent is to assess if there is any relationship between aquatic habitat quality and
SCLTS larval body condition. I will also assess if higher densities of SCLTS result in
worse body conditions.


Repository folders:

data: Contains subfolders for raw, processed, and output datasets

scripts/01processing: Contains R scripts used to process raw data into tidy format.



Tidy Dataset Column Metadata:

pond_year: The year and pond where measurements were obtained
body_condition: Mean body condition of SCLTS larvae at the site. Calculated as the average residuals of log(mass) vs. log(SVL)
larv_density: The density of SCLTS larvae in larvae/m^2
med_prey: Total number of chironomids, ghost midges, and amphipods found in 4 plankton tows
large_prey: Combined density of chorus frog tadpoles, planorbid snails, physid snails, and waterboatmen (#/m^2)
vert_pred: Combined density of newt larvae, newt adults, sticklebacks, sculpins, gambusia, and CTS (vertebrate predators/m^2)
invert_pred: Combined density of crawfish, dytiscids, anisoptera, belostomatids, and damselfly larvae (invertebrates/m^2)
plankton: Total number of plankton from 4 tows
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
suitable_598_split: Amount of upland habitat that is viable for SCLTS within 598m after accounting for barrier roads (m^2)
suitable_598: Amount of upland habitat that is viable for SCLTS within 598m (m^2; does not account for roads)
