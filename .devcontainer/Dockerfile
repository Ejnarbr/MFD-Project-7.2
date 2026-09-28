FROM rocker/rstudio:latest

# System libraries needed to build/load the R packages (sf, terra, igraph,
# rsvg, textshaping, ...), plus CLI tools used in this project.
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl wget jq git make cmake poppler-utils gdal-bin \
        libabsl-dev libcairo2-dev libcurl4-openssl-dev libfontconfig1-dev \
        libfreetype6-dev libfribidi-dev libgdal-dev libgeos-dev libgit2-dev \
        libglpk-dev libharfbuzz-dev libicu-dev libjpeg-dev libpng-dev \
        libpoppler-cpp-dev libproj-dev librsvg2-dev libsqlite3-dev libssl-dev \
        libtiff-dev libudunits2-dev libuv1-dev libwebp-dev libx11-dev \
        libxml2-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -q -e "install.packages('pak', repos = sprintf('https://r-lib.github.io/p/pak/stable/%s/%s/%s', .Platform\$pkgType, R.Version()\$os, R.Version()\$arch))"

# General-purpose packages used outside the MFD scripts.
RUN R -q -e "pak::pkg_install(c('httr', 'curl', 'jsonlite', 'rvest', 'pdftools'))"

# Packages required by the scripts in MFD_repo_clones/.
# System libs are installed above, so pak's own apt handling is disabled.
COPY install_r_packages.R /tmp/install_r_packages.R
RUN PKG_SYSREQS=false Rscript /tmp/install_r_packages.R \
    && rm /tmp/install_r_packages.R
