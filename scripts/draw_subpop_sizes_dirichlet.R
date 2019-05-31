library(MCMCpack) # for rdirichlet

draw_subpop_sizes_dirichlet <- function(n_ind, k_subpops) {
    # create random population sizes that are integers that sum to n_ind
    # however, very small populations are undesireable (don't want near zero counts),
    # so introduced a filter so that we resample until the smallest population is at least n_ind/(3*k_subpops) (a third of the mean)
    
    # vector of ones, as needed for rdirichlet below
    alpha <- rep.int(1, k_subpops)
    
    while (1) {
        # create random proportions with mean 1/k_subpops
        # then multiply by n_ind to get near-integers with mean n_ind/k_subpops
        # then round to have integers, though sum will be off by some amount
        subpop_sizes <- round( n_ind * drop( rdirichlet(1, alpha) ) )

        # will keep sampling until the smallest population is no smaller than a third of the mean
        if ( min(subpop_sizes) > n_ind / k_subpops / 3 )
            break
    }
    
    # now increment/decrement random populations until the desired sum is achieved
    while ( delta <- n_ind - sum(subpop_sizes) ) {
        # first pick a random index to change
        u <- sample.int(k_subpops, 1)
        if (delta > 0) { # this delta means counts are too low, so increment one!
            subpop_sizes[u] <- subpop_sizes[u] + 1
        } else { # else decrement
            subpop_sizes[u] <- subpop_sizes[u] - 1
        }
    }
    
    # construct subpopulation labels
    
    # initialize assignment vector
    labs <- vector('numeric', n_ind)
    # offset where subpopulation starts
    j <- 0
    
    # navigate subpopulations
    for (u in 1:k_subpops) {
        # get size of subpopulation u
        nu <- subpop_sizes[u]
        # set the following nu labels to u
        labs[ j + 1:nu ] <- u
        # increment offset for next subpopulation
        j <- j + nu
    }

    return(labs) # done, return!
}
