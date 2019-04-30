# a simple script for convering *.ind files from Reich lab into *.fam files that preserve subpopulation labels as family IDs

library(genio)

# constants
verbose <- TRUE

# get arguments from terminal
args <- commandArgs(trailingOnly = TRUE)

# usage
if (length(args) == 0) {
    message('Usage: Rscript ind_to_fam.R *.ind')
} else {

    # loop through options
    for (fi0 in args) {
        # remove desired extension
        name <- sub('\\.ind$', '', fi0, perl = TRUE)
        # reconstruct desired extensions
        fi <- paste0(name, '.ind')
        fo <- paste0(name, '.fam')
        # run or skip
        if (file.exists(fi)) {
            # read input file
            ind <- read_ind(fi, verbose = verbose)
            # convert tibbles
            fam <- ind_to_fam(ind)
            # write output file
            write_fam(fo, fam, verbose = verbose)
        } else {
            # either file didn't exist or extension was wrong
            message('Skipping: ', fi0)
        }
    }

}
