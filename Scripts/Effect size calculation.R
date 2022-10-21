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
