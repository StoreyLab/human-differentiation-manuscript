# this script reads in a .fam file with subpopulation labels as family IDs, and spits out singleton subpopulations!

library(genio)
library(tibble)
library(readr)

# get arguments from terminal
args <- commandArgs(trailingOnly = TRUE)

# usage
if (length(args) < 2)
    stop('Usage: Rscript singleton_fams.R <data.fam> <out.txt>')

# use first input only
fi <- args[1]
fo <- args[2]

# parse data!
fam <- read_fam(fi)

# get counts of family IDs
fam2c <- table(fam$fam)

# get the singleton families 
fam_singletons <- names( fam2c[fam2c == 1] )

# output!
message('Writing: ', fo)
write_tsv(tibble(fam_singletons), fo, col_names = FALSE)
