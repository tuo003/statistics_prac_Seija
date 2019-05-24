# statistics_prac_Seija
File Structure = data, scripts and results

NULL Hypothesis - There is no difference between using KCl and K2SO4 extractants on any soil to analyse different species of N.

What happens to Urea frertiliser once added to soil? 
Microbial activity is responsible for breakdown of feertiliser. 
Urea_N  --> NH3_N --> NO3_N 
NO3_N is the most stable species.

Treatments
  -Water,
  -Urea (4.66mg/g soil),
  
Species of N analysed = Response
  -NH3_N,
  -NO3_N,
  -TN,
  -Urea_N,
  -DON (dissolved organic nitrogen) is a calculation = TN - Urea_N - NH3_N - NO3_N.
  
Factors
  -Fertilizer (Water/Urea),
  -Soil 3 types - acid, alkali, neutral,
  -Extractant - KCl, K2SO4, Water.
  
  Materials and Methods
  
We selected the top 10 cm of soil from three different locations with differing soil properties. The soil samples were air dried at 40 degrees to a constant weight and ground to pass through a 2 mm sieve. Then 4 g of soil was weighed into 24 * 50 ml falcon tubes from soils A, B and C. Half of the samples received 1 ml of water and the other half received 1 ml of 1% Urea-N solution as a treatment. The falcon tubes were stoppered and incubated at 25 degrees for three days. Quadruplicate samples in 1:5, soil-solution ratio, were extracted with either deionised water, 2M KCl and 0.5M K2SO4 (Table 1). Each extract was filtered through a 0.45 um filter and analysed for NH3-N, (method USEPA 351.2), NO3-N (method USEPA 353.2), Urea (method Cozzi, S. 2004) and total nitrogen TN, (method USEPA 351.2) on O.I Analytical segmented flow analyser. Dissolved organic nitrogen, DON, is calculated from TN-sum of all species_N.

Soil Type	

A	Coastal acid	
  
B	Narrabri cotton alkali	
   	
C	Corowa neutral	
   	

WORKFLOW
  
1. Import data
  -restructure
  -check data types
  
2. Visualise data - which plots tell the story
  -"understand your data"
  
3. Fit a model to data
  -l1 = lm()
  -anova(l1) - main patterns
  -summary(l1) - parameter estimate
  -emmeans(l1, ~) - estimated means
    -SE = uncertainty
    -estimated mean differences
    
    -Inference to question - DELTA not equal to 0?
    -p values
    -checking model assumptions---> residual plot
    
Preliminary analyses tell me that the neutral soil did not get the microbial population going, maybe because it has been stored longer than the acid and alkali soils. Therefore we see Urea in the water extract. However, this was not the main point of the experiment and I treat this outcome as "Urea added to see some change in the experiment". The main point is to investigate which of the other two extractants work more completely.     
    
    
  
