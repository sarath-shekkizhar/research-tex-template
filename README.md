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

## Working with Claude Code

This template is optimized for use with Claude Code. You can ask Claude to:

### Writing Assistance
- "Help me write the introduction for a paper about [topic]"
- "Expand this paragraph to explain [concept] more clearly"
- "Suggest improvements to make this section more concise"

### Finding References
- "Find recent papers on [topic] and add citations to my bibliography"
- "Search for papers about [specific method] published after 2022"
- "Add BibTeX entries for foundational works in [area]"

Note: Your global CLAUDE.md includes instructions for Claude to always search the web for the latest BibTeX references.

### Organization and Structure
- "Create a table showing my experimental results"
- "Generate TikZ code for a flowchart of my method"
- "Help me organize my related work section by research themes"

### Technical Tasks
- "Set up my author list and affiliations"
- "Create placeholder sections for missing content"
- "Check for broken references and labels"

## Conference-Specific Instructions

### ICML (Included)

This template uses ICML 2025 format by default.

```latex
\usepackage[accepted]{icml2025}  % Accepted version
% \usepackage{icml2025}           % Submission version (anonymous)
```

### Adapting to Other Conferences

**NeurIPS**: Replace `icml2025.sty` with `neurips_2024.sty`
```latex
\usepackage[final]{neurips_2024}
```

**ICLR**: Replace with `iclr2025_conference.sty`
```latex
\usepackage{iclr2025_conference}
```

**ACL/EMNLP**: Replace with `acl.sty`
```latex
\usepackage[hyperref]{acl}
```

**CVPR**: Replace with `cvpr.sty`
```latex
\usepackage{cvpr}
```

Download style files from the conference website and update the `\usepackage` statement in `main.tex`.

## Tips and Best Practices

### LaTeX Best Practices

1. **Use labels consistently**: `\label{sec:intro}`, `\label{fig:overview}`, `\label{tab:results}`
2. **Reference correctly**: Use `\ref{}`, `\cite{}`, `\eqref{}` for numbers
3. **Use cleveref**: `\cref{sec:intro}` automatically adds "Section"
4. **Vector graphics**: Always use PDF for plots and diagrams
5. **booktabs tables**: Use `\toprule`, `\midrule`, `\bottomrule`

### Writing Tips

1. **Clear contributions**: Enumerate your contributions explicitly
2. **Figure quality**: Make sure all text in figures is readable
3. **Reproducibility**: Include sufficient implementation details
4. **Citation style**: Use `\citep{}` for parenthetical, `\citet{}` for textual
5. **Math notation**: Define notation clearly and use consistently

### Claude Code Integration

1. **Iterative writing**: Ask Claude to draft sections, then refine them
2. **Literature search**: Use Claude's web search to find relevant papers
3. **Code generation**: Ask for TikZ diagrams, tables, or formatting help
4. **Proofreading**: Request improvements for clarity and conciseness

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

## Troubleshooting

### LaTeX won't compile
1. Check for missing closing braces `}`, brackets `]`, or `\end{environment}`
2. Look at the error message location (line number)
3. Ensure all referenced labels exist
4. Run `make clean` and rebuild

### References not showing
1. Run: `pdflatex main.tex` → `bibtex main` → `pdflatex main.tex` → `pdflatex main.tex`
2. Or just use `make` which handles this automatically
3. Check that citations match keys in `main.bib`

### Figures not appearing
1. Ensure file path is correct (no file extension in `\includegraphics`)
2. Check figure format (PDF, PNG, JPG are recommended)
3. Verify file exists in `figures/` directory

### Overleaf users
1. Upload all files maintaining the directory structure
2. Set `main.tex` as the main document
3. Overleaf handles compilation automatically

## Version Control

Initialize a git repository to track changes:

```bash
git init
git add .
git commit -m "Initial commit: research paper template"
```

The `.gitignore` is already configured to exclude build artifacts.

## License

This template is provided as-is for academic and research use. Modify as needed for your work.

## Contributing

Improvements and suggestions welcome! This template is designed to evolve with best practices in academic writing and tooling.

## Resources

- **LaTeX Documentation**: https://www.latex-project.org/help/documentation/
- **Overleaf Guides**: https://www.overleaf.com/learn
- **TikZ & PGF**: https://tikz.dev
- **Booktabs Package**: https://ctan.org/pkg/booktabs
- **Claude Code**: https://docs.claude.com/claude-code

---

**Happy writing! 🚀**

For questions or issues, ask Claude Code for help - it's designed to assist with all aspects of paper writing using this template.
