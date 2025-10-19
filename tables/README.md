# Tables Directory

This directory contains LaTeX table definitions for your paper.

## Organization

```
tables/
├── README.md (this file)
├── main_results.tex      # Main experimental results
├── ablation.tex          # Ablation study results
├── dataset_stats.tex     # Dataset statistics
├── hyperparameters.tex   # Hyperparameter settings
└── comparison.tex        # Comparison with prior work
```

## Best Practices

1. **Separate Files**
   - Keep each major table in its own `.tex` file
   - Include them in main paper with `\input{tables/filename}`
   - This keeps your main document organized and maintainable

2. **Table Formatting**
   - Use `booktabs` package for professional tables (included in template)
   - Use `\toprule`, `\midrule`, `\bottomrule` instead of `\hline`
   - Avoid vertical lines - they make tables look cluttered
   - Bold best results for easy scanning

3. **Naming Conventions**
   - Use descriptive names: `main_results.tex`, `ablation_study.tex`
   - Match table names to their labels in the document

## Example Table Template

```latex
% tables/main_results.tex
\begin{table}[t]
\centering
\caption{Main experimental results. Best results in \textbf{bold}.}
\label{tab:main-results}
\begin{tabular}{lccc}
\toprule
Method & Dataset A & Dataset B & Average \\
\midrule
Baseline 1 & 75.2 & 78.5 & 76.9 \\
Baseline 2 & 78.1 & 80.2 & 79.2 \\
\textbf{Ours} & \textbf{82.3} & \textbf{84.1} & \textbf{83.2} \\
\bottomrule
\end{tabular}
\end{table}
```

## Including Tables in LaTeX

In your main paper:
```latex
\input{tables/main_results}
```

Or inline if the table is small:
```latex
\begin{table}[t]
\centering
\caption{Small example table}
...
\end{table}
```

## Tips for Claude Code

When working with Claude Code, you can ask it to:
- "Create a table template for my experimental results"
- "Format this data as a LaTeX table using booktabs"
- "Help me organize complex data into a readable table"
- "Generate tables from CSV data"
