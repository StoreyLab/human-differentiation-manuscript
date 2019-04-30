# a hacky script to remove redundant subpopulation information in the subject IDs of the public Pacific data only

library(genio)

# constants
verbose <- TRUE

# get arguments from terminal
args <- commandArgs(trailingOnly = TRUE)

# usage
if (length(args) == 0) {
    message('Usage: Rscript fam_clean_pacific.R <name>.fam')
} else {
    # assume a single file
    file <- args[1]
    # read input file
    fam <- read_fam(file, verbose = verbose)
    # this removes the reundant subpopulation labels
    # this is very unsophisticated!
    # deletes everything up to and including the first colon
    fam$id <- sub('^[^:]+:', '', fam$id)
    # overwrite input file
    write_fam(file, fam, verbose = verbose)
}
