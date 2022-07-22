FROM islasgeci/base:latest
COPY . /workdir
RUN Rscript -e "install.packages(c('covr', 'DT', 'lintr', 'pkgdown', 'roxygen2', 'styler', 'testthat'), repos='http://cran.rstudio.com')"
RUN Rscript -e "install.packages(c('devtools','vdiffr'), repos='http://cran.rstudio.com')"
