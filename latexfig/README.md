# LaTeXFig Directory

This directory contains complex figures created directly with LaTeX/TikZ.

## Purpose

While most figures are created externally (matplotlib, etc.) and saved as PDFs in `figures/`, this directory is for:
- TikZ diagrams (flowcharts, architectures, decision trees)
- Complex multi-part figures with subfigures
- Figures combining multiple images with LaTeX overlays
- Algorithm visualizations requiring precise LaTeX control

## Organization

```
latexfig/
├── README.md (this file)
├── method_diagram.tex    # TikZ method overview
├── architecture.tex      # Network architecture diagram
├── flowchart.tex        # Algorithm flowchart
└── examples/            # Example code for common patterns
    ├── tikz_flowchart.tex
    ├── subfigures.tex
    └── algorithm_viz.tex
```

## Example: Simple TikZ Diagram

```latex
% latexfig/flowchart.tex
\begin{figure}[t]
    \centering
    \begin{tikzpicture}[
        node distance=2cm,
        box/.style={rectangle, draw, thick, minimum width=2cm, minimum height=1cm},
        arrow/.style={->, thick}
    ]
        \node[box] (input) {Input};
        \node[box, right of=input] (process) {Process};
        \node[box, right of=process] (output) {Output};

        \draw[arrow] (input) -- (process);
        \draw[arrow] (process) -- (output);
    \end{tikzpicture}
    \caption{Simple flowchart example}
    \label{fig:flowchart}
\end{figure}
```

## Example: Multi-panel Figure

```latex
% latexfig/comparison.tex
\begin{figure*}[t]
    \centering
    \begin{subfigure}[t]{0.48\textwidth}
        \includegraphics[width=\textwidth]{figures/method_a}
        \caption{Method A}
        \label{fig:comparison-a}
    \end{subfigure}
    \hfill
    \begin{subfigure}[t]{0.48\textwidth}
        \includegraphics[width=\textwidth]{figures/method_b}
        \caption{Method B}
        \label{fig:comparison-b}
    \end{subfigure}
    \caption{Comparison of two methods}
    \label{fig:comparison}
\end{figure*}
```

## Including LaTeX Figures

In your main paper:
```latex
\input{latexfig/method_diagram}
```

## Common TikZ Patterns

The template includes the `tikz` package for creating diagrams. Common use cases:
- Neural network architectures
- Decision trees and flowcharts
- Algorithm state machines
- Data flow diagrams
- Geometric illustrations

## Tips for Claude Code

When working with Claude Code, you can ask it to:
- "Create a TikZ flowchart showing my method's pipeline"
- "Generate a neural network architecture diagram with TikZ"
- "Help me create a multi-panel figure comparing results"
- "Convert this conceptual description into a TikZ diagram"

## Resources

- TikZ Documentation: https://tikz.dev
- PGFPlots for data visualization: https://pgfplots.sourceforge.net
- LaTeX Graphics Companion book
