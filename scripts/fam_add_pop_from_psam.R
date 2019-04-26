# a script for transfering TGP population labels to plink FAM files
# uses genio a bit but also performs a lot of sanity checks specific to the TGP data (doesn't quite generalize)

library(genio)
library(readr)

# constants
verbose <- TRUE

# get arguments from terminal
args <- commandArgs(trailingOnly=TRUE)

# usage
if (length(args) < 3) {
    message('Usage: Rscript fam_add_pop_from_psam.R <input.psam> <input.fam> <output.fam>')
} else {
    # name file paths
    file_in_psam <- args[1]
    file_in_fam <- args[2]
    file_out <- args[3]
    
    # read inputs:
    fam <- read_fam(file_in_fam, verbose = verbose)
    psam <- read_tsv(file_in_psam, col_types = 'cccicc')

    # make sure column to overwite is trivial as expected
    stopifnot( all( fam$fam == 0 ) )

    # make sure desired columns in psam file are present
    stopifnot( all( c('#IID', 'Population') %in% names(psam) ) )

    # make sure all IDs in fam are present in psam
    stopifnot( all( fam$id %in% psam$`#IID` ) )

    # now match the respective rows
    indexes <- match( fam$id, psam$`#IID` )

    # make sure IDs agree after this reordering/subsetting
    # (I often get this wrong)
    stopifnot( all( fam$id == psam$`#IID`[indexes] ) )

    # overwrite column as desired
    fam$fam <- psam$Population[indexes]
    
    # write output file
    write_fam(file_out, fam, verbose = verbose)
}
