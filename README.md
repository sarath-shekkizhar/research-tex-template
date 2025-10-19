# Research Paper LaTeX Template

A well-organized LaTeX template for writing research papers, optimized for machine learning conferences (ICML, NeurIPS, ICLR, etc.) and designed to work seamlessly with Claude Code.

## Quick Start

```bash
# Clone or download this template
git clone <your-repo-url>

# Compile the paper
make

# Or manually with pdflatex
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## Directory Structure

```
research-template/
├── main.tex                    # Main document
├── main.bib                    # Bibliography file
├── Makefile                    # Build automation
├── README.md                   # This file
│
├── chapters/                   # Paper sections
│   ├── abstract.tex
│   ├── introduction.tex
│   ├── method.tex
│   ├── experiments.tex
│   ├── related_works.tex
│   ├── conclusion.tex
│   ├── acknowledgements.tex
│   ├── impact_statement.tex
│   └── appendix/              # Appendix sections
│       ├── additional_results.tex
│       ├── implementation.tex
│       └── proofs.tex
│
├── figures/                    # Image files (PDF, PNG, JPG)
│   └── README.md              # Organization guide
│
├── tables/                     # LaTeX table definitions
│   └── README.md              # Best practices
│
├── latexfig/                   # Complex LaTeX/TikZ figures
│   └── README.md              # Examples and tips
│
└── Conference style files      # ICML 2025 included
    ├── icml2025.sty
    ├── icml2025.bst
    ├── algorithm.sty
    ├── algorithmic.sty
    └── fancyhdr.sty
```

## Using This Template

### 1. Customize Paper Metadata

Edit `main.tex` starting at line 115:

```latex
\icmltitle{Your Paper Title Here}
\icmlauthor{First Author}{inst1}
\icmlauthor{Second Author}{inst2}
...
\icmlaffiliation{inst1}{First Institution}
\icmlcorrespondingauthor{First Author}{email@inst.edu}
\icmlkeywords{Your, Keywords, Here}
```

### 2. Define Custom Commands

Add your paper-specific commands in `main.tex` around line 78:

```latex
% Example: Method name
\newcommand{\methodname}{\textsc{YourMethod}\xspace}

% Example: Dataset names
\newcommand{\dataset}{\texttt{YourDataset}\xspace}

% Example: Metrics
\newcommand{\accuracy}{95.3\%\xspace}
```

### 3. Write Your Paper

Edit the chapter files in `chapters/`:
- **abstract.tex**: 150-250 words summarizing your work
- **introduction.tex**: Motivation, problem, approach, contributions
- **method.tex**: Technical details of your approach
- **experiments.tex**: Setup, results, ablations, analysis
- **related_works.tex**: Prior work organized by theme
- **conclusion.tex**: Summary and impact

Each file includes detailed guidance and structure suggestions.

### 4. Add Figures and Tables

**Figures**: Place images in `figures/` and include with:
```latex
\begin{figure}[t]
    \centering
    \includegraphics[width=0.8\linewidth]{figures/your_figure}
    \caption{Your caption}
    \label{fig:your-label}
\end{figure}
```

**Tables**: Create in `tables/` and include with:
```latex
\input{tables/your_table}
```

See README files in each directory for best practices.

### 5. Manage References

Add BibTeX entries to `main.bib`:

```bibtex
@inproceedings{smith2024method,
  author    = {John Smith and Jane Doe},
  title     = {A Novel Method for Deep Learning},
  booktitle = {ICML},
  year      = {2024}
}
```

Cite in text with `\cite{smith2024method}` or `\citep{smith2024method}`.

### 6. Build the PDF

```bash
# Using Make (recommended)
make

# Clean build artifacts
make clean

# Full rebuild
make clean all
```

## Common Commands

### Document Layout
- `\section{Title}`: Main section
- `\subsection{Title}`: Subsection
- `\subsubsection{Title}`: Subsubsection
- `\label{sec:name}`: Add label for referencing
- `\ref{sec:name}`: Reference section by number

### Mathematics
- `$x + y$`: Inline math
- `\[equation\]` or `\begin{equation}`: Display math
- `\begin{align}`: Multiple aligned equations
- Common symbols: `\alpha, \beta, \mathbb{R}, \mathcal{L}`

### Figures and Tables
- `\includegraphics[options]{path}`: Include image
- `\begin{tabular}{lcc}`: Create table (left, center, center columns)
- `\toprule, \midrule, \bottomrule`: Professional table rules

### References
- `\cite{key}`: Citation
- `\citep{key}`: Parenthetical citation
- `\citet{key}`: Textual citation (Author et al. year)

### Custom Commands (included)
- `\ie`: i.e.,
- `\eg`: e.g.,
- `\etal`: et al.
- `\wrt`: w.r.t.

## Version Control

Initialize a git repository to track changes:

```bash
git init
git add .
git commit -m "Initial commit: research paper template"
```

The `.gitignore` is already configured to exclude build artifacts.

## Contributing

Improvements and suggestions welcome! This template is designed to evolve with best practices in academic writing and tooling.

---

**Happy writing! 🚀**
