submissions: pollos_petrel/example_r_submission.csv  lizeth_submissions pollos_petrel/example_lizeth_square_model_submission.csv
pollos_petrel/example_r_submission.csv: setup_r src/example_submission.R
	@echo "Creating R submission from Lizeth..."
	src/example_submission.R
lizeth_submissions: setup_r src/lizeth_submission.R
	@echo "Creating R submission from Lizeth..."
	src/lizeth_submission.R
pollos_petrel/example_lizeth_square_model_submission.csv: setup_r src/lizeth_square_model_submission.R
	@echo "Creating R submission from Lizeth..."
	src/lizeth_square_model_submission.R

module = pollos_petrel

define lint
	pylint \
        --disable=bad-continuation \
        --disable=missing-class-docstring \
        --disable=missing-function-docstring \
        --disable=missing-module-docstring \
        ${1}
endef

.PHONY: \
    check \
    clean \
    coverage \
    coverage_python \
    coverage_r \
    format \
    init \
    linter \
    lizeth_submissions \
    mutants \
    mutants_python \
    mutants_r \
    setup \
    setup_python \
    setup_r \
    submissions \
    tests \
    tests_python \
    tests_r

check:
	R -e "library(styler)" \
      -e "resumen <- style_dir('R')" \
      -e "resumen <- rbind(resumen, style_dir('src'))" \
      -e "resumen <- rbind(resumen, style_dir('tests'))" \
      -e "any(resumen[[2]])" \
      | grep FALSE

clean:
	rm --force --recursive ${module}.egg-info
	rm --force --recursive ${module}/__pycache__
	rm --force --recursive .*_cache
	rm --force --recursive SeleccionAnalista2022.Rcheck
	rm --force --recursive tests/__pycache__
	rm --force --recursive tests/testthat/_snaps
	rm --force .mutmut-cache
	rm --force NAMESPACE
	rm --force SeleccionAnalista2022_*.tar.gz
	rm --force coverage.xml
	rm --force pollos_petrel/example_*_submission.csv

coverage: coverage_python coverage_r

coverage_python: setup_python
	pytest --cov=${module} --cov-report=term-missing --verbose

coverage_r: setup_r
	Rscript tests/testthat/coverage.R

format:
	R -e "library(styler)" \
      -e "style_dir('R')" \
      -e "style_dir('src')" \
      -e "style_dir('tests')"
init: setup_r tests_r

linter:
	$(call lint, ${module})
	$(call lint, tests)

mutants: mutants_python mutants_r

mutants_python: setup_python tests_python
	mutmut run --paths-to-mutate ${module}
	mutmut run --paths-to-mutate src

mutants_r: setup_r tests_r
	@echo "🙁🏹 No mutation testing on R 👾🎉👾"

setup: setup_python setup_r

setup_python: clean
	pip install --editable .

setup_r: clean
	R -e "devtools::document()" && \
    R CMD build . && \
    R CMD check SeleccionAnalista2022_0.1.0.tar.gz && \
    R CMD INSTALL SeleccionAnalista2022_0.1.0.tar.gz

tests: tests_r

tests_r:
	Rscript -e "devtools::test(stop_on_failure = TRUE)"
