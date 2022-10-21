# PROJECT: 
# PURPOSE: 
# AUTHOR: Nelly Maina| SI
# REF ID:   8ef973df
# LICENSE: MIT
# DATE: 2022-10-21
# NOTES: Nelly Maina| SI

# LOCALS & SETUP ============================================================================

  # Libraries
    oha
    
  # SI specific paths/functions  
    load_secrets()
    merdata <- file.path(glamr::si_path("path_msd"))
    file_path <- return_latest(folderpath = merdata,
      pattern = "Site_IM_FY20-22_20220318_v2_1_Zambia")
      
  # Grab metadata
   msd_source <- source_info(file_path)
   curr_pd <- source_info(file_path, return = "period")
   pd <- source_info(file_path, return = "period")
   fy <- source_info(file_path, return = "fiscal_year")
   qtr <- source_info(file_path, return = "quarter")  
  
  # REF ID for plots
    ref_id <- "8ef973df"
    
  # Functions  
  

# LOAD DATA ============================================================================  

  msd

# MUNGE ============================================================================
  
  #  
  
# VIZ ============================================================================

  #  

# SPINDOWN ============================================================================


#test github pull and push

library(readxl)
library(effectsize)

df <- read_excel("Data/Effect size calculations_ Raw data.xlsx", 
                 sheet = "Sheet3", skip = 1)
View(df)

hist(df$TX_PVLS...3,main = "TX_PVLS 2020",
     xlab = " TXPVLS ")
hist(df$TX_PVLS...5, col = "Blue",add = TRUE)

t.test(df$TX_PVLS...3,df$TX_PVLS...5, alternative = "two.sided",
       paired = TRUE, var.equal = TRUE )

# Decision: reject Null Hypothesis at alpha =0.05 
# There is a difference in PVLS at the facility level

cohens_d(df$TX_PVLS...3,df$TX_PVLS...5)
