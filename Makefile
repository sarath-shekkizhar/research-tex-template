# ========================================
# Makefile for LaTeX Paper Compilation
# ========================================
# This Makefile automates the compilation of your research paper.
#
# Usage:
#   make          - Compile the paper (runs pdflatex + bibtex as needed)
#   make clean    - Remove all build artifacts
#   make view     - Compile and open the PDF (macOS)
#   make watch    - Continuously compile on file changes (requires entr or latexmk)
#   make count    - Count words in the paper (requires texcount)

# Configuration
MAIN = main
TEX = pdflatex
BIB = bibtex
VIEWER = open  # Use 'evince' or 'xdg-open' on Linux

# Detect OS for viewer
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    VIEWER = xdg-open
endif
ifeq ($(UNAME_S),Darwin)
    VIEWER = open
endif

# LaTeX flags
TEXFLAGS = -interaction=nonstopmode -halt-on-error

# Default target: build the paper
.PHONY: all
all: $(MAIN).pdf

# Full compilation with bibliography
$(MAIN).pdf: $(MAIN).tex $(wildcard chapters/*.tex) $(wildcard chapters/appendix/*.tex) $(MAIN).bib
	@echo "========================================"
	@echo "Compiling $(MAIN).tex (first pass)..."
	@echo "========================================"
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	@echo ""
	@echo "========================================"
	@echo "Running BibTeX..."
	@echo "========================================"
	$(BIB) $(MAIN)
	@echo ""
	@echo "========================================"
	@echo "Compiling $(MAIN).tex (second pass)..."
	@echo "========================================"
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	@echo ""
	@echo "========================================"
	@echo "Compiling $(MAIN).tex (final pass)..."
	@echo "========================================"
	$(TEX) $(TEXFLAGS) $(MAIN).tex
	@echo ""
	@echo "========================================"
	@echo "✓ Compilation complete: $(MAIN).pdf"
	@echo "========================================"

# Quick compilation without bibliography update
.PHONY: quick
quick:
	@echo "Quick compilation (no bibliography update)..."
	$(TEX) $(TEXFLAGS) $(MAIN).tex

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(MAIN).pdf
	rm -f $(MAIN).aux $(MAIN).log $(MAIN).out
	rm -f $(MAIN).bbl $(MAIN).blg
	rm -f $(MAIN).toc $(MAIN).lot $(MAIN).lof
	rm -f $(MAIN).fdb_latexmk $(MAIN).fls
	rm -f $(MAIN).synctex.gz
	rm -f *.aux chapters/*.aux chapters/appendix/*.aux
	@echo "✓ Clean complete"

# Deep clean (including editor backups)
.PHONY: distclean
distclean: clean
	@echo "Deep cleaning..."
	rm -f *~ *.backup
	rm -f chapters/*~ chapters/*.backup
	rm -f chapters/appendix/*~ chapters/appendix/*.backup
	@echo "✓ Deep clean complete"

# Compile and view the PDF
.PHONY: view
view: $(MAIN).pdf
	@echo "Opening $(MAIN).pdf..."
	$(VIEWER) $(MAIN).pdf

# Watch for changes and recompile (requires latexmk)
.PHONY: watch
watch:
	@echo "Watching for changes... (Ctrl+C to stop)"
	@if command -v latexmk > /dev/null; then \
		latexmk -pdf -pvc -interaction=nonstopmode $(MAIN).tex; \
	else \
		echo "Error: latexmk not found. Install with: brew install latexmk (macOS) or apt install latexmk (Linux)"; \
		exit 1; \
	fi

# Alternative watch using entr (lighter weight)
.PHONY: watch-entr
watch-entr:
	@echo "Watching for changes with entr... (Ctrl+C to stop)"
	@if command -v entr > /dev/null; then \
		find . -name "*.tex" -o -name "*.bib" | entr -c make quick; \
	else \
		echo "Error: entr not found. Install with: brew install entr (macOS) or apt install entr (Linux)"; \
		exit 1; \
	fi

# Word count (requires texcount)
.PHONY: count
count:
	@if command -v texcount > /dev/null; then \
		echo "Word count for $(MAIN).tex:"; \
		texcount -total -q -col $(MAIN).tex; \
	else \
		echo "Error: texcount not found. Install from https://ctan.org/pkg/texcount"; \
		exit 1; \
	fi

# Spell check (requires aspell)
.PHONY: spell
spell:
	@if command -v aspell > /dev/null; then \
		echo "Spell checking..."; \
		for file in $(MAIN).tex chapters/*.tex chapters/appendix/*.tex; do \
			echo "Checking $$file..."; \
			aspell --mode=tex check $$file; \
		done; \
	else \
		echo "Error: aspell not found. Install with: brew install aspell (macOS) or apt install aspell (Linux)"; \
		exit 1; \
	fi

# Check for common LaTeX issues
.PHONY: check
check:
	@echo "Checking for common issues..."
	@echo "- Checking for TODO markers..."
	@grep -n "TODO\|FIXME\|XXX" $(MAIN).tex chapters/*.tex chapters/appendix/*.tex || echo "  ✓ No TODOs found"
	@echo "- Checking for undefined references..."
	@grep "LaTeX Warning.*undefined" $(MAIN).log 2>/dev/null || echo "  ✓ No undefined references"
	@echo "- Checking for overfull hboxes..."
	@grep "Overfull" $(MAIN).log 2>/dev/null || echo "  ✓ No overfull hboxes"
	@echo "✓ Check complete"

# Show help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make (all)     - Compile the paper with bibliography"
	@echo "  make quick     - Quick compile without updating bibliography"
	@echo "  make clean     - Remove build artifacts"
	@echo "  make distclean - Deep clean including backups"
	@echo "  make view      - Compile and open the PDF"
	@echo "  make watch     - Auto-recompile on changes (requires latexmk)"
	@echo "  make count     - Count words (requires texcount)"
	@echo "  make spell     - Spell check (requires aspell)"
	@echo "  make check     - Check for common issues"
	@echo "  make help      - Show this help message"

# Prevent make from deleting intermediate files
.PRECIOUS: $(MAIN).pdf

# Default shell
SHELL := /bin/bash
