##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## [Filename]       Makefile
## [Project]        
## [Author]         Ciro Bermudez - cirofabian.bermudezmarquez@ba.infn.it
## [Language]       GNU Makefile
## [Created]        Nov 2024
## [Modified]       -
## [Description]    Generate and compile LaTeX document
## [Notes]          
## [Status]         -
## [Revisions]      -
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## colors
C_RED := \033[31m
C_GRE := \033[32m
C_BLU := \033[34m
C_YEL := \033[33m
C_ORA := \033[38;5;214m
NC    := \033[0m 

## file names
GNUPLOT_FILES = plot.gp
LATEX_FILES = main.tex

## gnuplot output 1:PNG 2:PDF 3:LaTeX
MODE ?= 1

all: help

.PHONY: latex
latex: ## Compile latex
	@echo -e "$(C_ORA)Generating LaTeX PDF$(NC)"
	pdflatex main.tex > pdflatex.log

.PHONY: gnuplot
gnuplot: ## Generate plot with gnuplot
	@echo -e "$(C_ORA)Generating images with gnuplot$(NC)"
	gnuplot -c $(GNUPLOT_FILES) $(MODE)

.PHONY: view
view: ## View gnuplot output
	@echo -e "$(C_ORA)Opening gnuplot output$(NC)"

.PHONY: clean
clean: ## Remove all simulation files
	@echo -e "$(C_ORA)Removing all temporary files$(NC)"
	rm -rf *.log *.aux *.gz

.PHONY: help
help: ## Display help message
	@echo ""
	@echo "======================================================================"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "--------------------------- Targets ----------------------------------"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "- make \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "======================================================================"
	@echo ""
