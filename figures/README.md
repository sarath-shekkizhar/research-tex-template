# Figures Directory

This directory contains all your paper's figures and images.

## Organization

```
figures/
├── README.md (this file)
├── overview.pdf          # Method overview diagram
├── results.pdf           # Main results visualization
├── architecture.pdf      # Architecture diagram
├── ablation/            # Ablation study figures
│   ├── component1.pdf
│   └── component2.pdf
└── qualitative/         # Qualitative examples
    ├── example1.pdf
    └── example2.pdf
```

## Best Practices

1. **File Formats**
   - Use vector formats (PDF, SVG) for plots, diagrams, and charts
   - Use raster formats (PNG, JPG) only for photographs or screenshots
   - Avoid using EPS format (PDF is preferred in modern LaTeX)

2. **Naming Conventions**
   - Use descriptive, lowercase names with underscores
   - Examples: `method_overview.pdf`, `main_results.pdf`, `ablation_component.pdf`
   - Avoid spaces and special characters in filenames

3. **Figure Quality**
   - Ensure high resolution (at least 300 DPI for raster images)
   - Use consistent fonts and font sizes across all figures
   - Make sure text in figures is readable after scaling

4. **Organization**
   - Group related figures in subdirectories
   - Keep the main directory clean with only top-level figures

## Including Figures in LaTeX

```latex
\begin{figure}[t]
    \centering
    \includegraphics[width=0.8\linewidth]{figures/method_overview}
    \caption{Overview of our method showing the main components.}
    \label{fig:method}
\end{figure}
```

## Tips for Claude Code

When working with Claude Code, you can ask it to:
- "Create a placeholder figure with text describing what should go here"
- "Generate LaTeX code to include this figure with caption"
- "Help me organize figures into subdirectories by section"
