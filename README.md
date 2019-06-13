# Human differentiation analysis

Details on the data analysis for two parallel publications:

- ["New kinship and FST estimates reveal higher levels of differentiation in the global human population" by Ochoa and Storey](https://doi.org/10.1101/653279).
  - [human-origins-00-preprocessing.pdf](human-origins-00-preprocessing.pdf): 
    Pre-processing the raw Human Origins data to obtain the files under [data/](data/)
  - [human-origins-01-analysis.pdf](human-origins-01-analysis.pdf): 
    Our analysis of the Human Origins data available under [data/](data/).
  - [hispanics-00-preprocessing.pdf](hispanics-00-preprocessing.pdf): 
    Pre-processing the raw 1000 Genomes data to obtain the files under [data/](data/)
  - [hispanics-01-analysis.pdf](hispanics-01-analysis.pdf): 
    Our analysis of the Hispanic individuals in 1000 Genomes data available under [data/](data/).
- ["FST and kinship for arbitrary population structures II: Method of moments estimators" by Ochoa and Storey](https://doi.org/10.1101/083923).
  - [simulations-analysis.pdf](simulations-analysis.pdf):
    Our analysis of simulated genotype data (randomly generated inside the vignette using the `bnpsd` package).
	Considers independent subpopulations (the classical FST setting) and differentially-admixed individuals (a complex population structure only our approach handles correctly).

## BED and BIM files on Large File Storage

This repository contains very large files (BED and BIM extensions) stored on GitHub's "Large File Storage", which means that regular `git` commands like `git clone` will not download these large files unless the `git-lfs` extension is installed.
After cloning, if the desired files are still missing (small files with the same paths are merely links), you may need to run `git lfs pull` to retrieve these large files.

See https://git-lfs.github.com/ for more information.

If you have any problems downlading this data, a copy of the entire `data/` subdirectory is also available here:
http://viiia.org/human-differentiation-manuscript-data.zip
