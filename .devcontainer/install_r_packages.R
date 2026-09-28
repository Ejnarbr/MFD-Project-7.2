# R packages required by the scripts in MFD_repo_clones/.
# Derived from library()/require()/pkg:: calls across all .R/.Rmd files.
# Installed at image build time (see Dockerfile). pak resolves CRAN,
# Bioconductor and GitHub sources and installs the needed apt system libraries.

pkgs <- c(
  # --- CRAN -----------------------------------------------------------------
  "tidyverse", "dplyr", "ggplot2", "stringr", "stringi", "tibble", "tidyr",
  "readr", "forcats", "lubridate", "rlang", "scales", "data.table",
  "readxl", "openxlsx", "writexl", "jsonlite", "optparse", "gtools",
  "knitr", "rmarkdown", "kableExtra", "webshot2", "svglite", "rsvg",
  "ggpubr", "gridExtra", "cowplot", "patchwork", "lemon", "ggplotify",
  "ggnewscale", "ggbeeswarm", "ggvenn", "ggpmisc", "ggraph", "ComplexUpset",
  "wesanderson", "pals",
  "vegan", "ape", "igraph", "iNEXT", "MESS", "matrixStats", "rstatix",
  "dendroextras",
  "tidymodels", "themis", "ranger", "doFuture", "usdm", "tidysdm",
  "sf", "sp", "terra", "maps", "mapproj", "ggspatial", "rnaturalearth",
  "ghql", "devtools", "BiocManager",
  # --- Bioconductor ---------------------------------------------------------
  "bioc::Biostrings",
  # ggtree, treeio, tidytree, ggtreeExtra come in via treedataverse below
  # --- GitHub (not on CRAN) -------------------------------------------------
  "YuLab-SMU/treedataverse",
  "davidsjoberg/ggsankey",
  "sebastianbarfort/mapDK",
  "kasperskytte/ampvis2",
  "koalaverse/vip"          # archived from CRAN
)

# rgdal (used only in mfd_metadata/scripts/R_scripts/mfd_report.Rmd) was
# retired from CRAN in 2023 and does not build on current R; use sf instead
# (sf::st_read / sf::st_write replace readOGR / writeOGR).

pak::pkg_install(pkgs, upgrade = FALSE, ask = FALSE)
