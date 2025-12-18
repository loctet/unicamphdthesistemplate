# University of Camerino Thesis Template

A LaTeX template for writing PhD theses at the University of Camerino (UNICAM). This template provides a professional structure and formatting that follows academic standards.

## Features

- Professional thesis formatting based on UNICAM requirements
- Organized chapter structure
- Bibliography management with BibTeX
- Support for figures, tables, algorithms, and code listings
- Customizable macros and packages
- Clean, modern typography

## Requirements

To use this template, you need:

- A LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Required LaTeX packages (most are included in standard distributions)
- A PDF viewer for viewing the compiled document

### Recommended LaTeX Packages

The template uses many standard packages. If you encounter missing package errors, install them using your LaTeX distribution's package manager:

- `book` (base class)
- `geometry`, `graphicx`, `xcolor`
- `amsmath`, `amssymb`, `amsthm`
- `hyperref`, `cleveref`
- `algorithm`, `algorithmicx`
- `listings`
- `tikz`
- And many others (see `macros/packages.tex`)

## Getting Started

1. **Clone or download this repository**
   ```bash
   git clone <repository-url>
   cd thesistemplate
   ```

2. **Customize the thesis information**
   Edit `main.tex` and update the following fields:
   ```latex
   \title{A thesis template for the University of Camerino}
   \author{John Doe}
   \coursename{Computer Science}
   \curriculumname{Computer Science}
   \cyclenumber{XXXVIII}
   \supervisorname{Dr. John Doe}
   \cosupervisorname{Prof. Jane Doe}
   \coordinatorname{Prof. John Doe}
   \dateofaward{XXX 2026}
   ```

3. **Add your university logos**
   Place your university logos in the `logos/` directory and update the logo references in `style/unicamthesis.cls` if needed.

4. **Compile the document**
   ```bash
   pdflatex main.tex
   bibtex main
   pdflatex main.tex
   pdflatex main.tex
   ```
   
   Or use `latexmk` for automatic compilation:
   ```bash
   latexmk -pdf main.tex
   ```

## Project Structure

```
thesistemplate/
├── main.tex                 # Main document file
├── abstract.tex             # Abstract content
├── acknowledgements.tex     # Acknowledgements
├── declaration.tex          # Declaration statement
├── appendix.tex             # Appendix content
├── bib.bib                  # Bibliography database
├── chapters/                # Chapter files
│   ├── intro/
│   │   └── intro.tex        # Introduction chapter
│   ├── stateofart/
│   │   └── state-of-art.tex # Literature review chapter
│   ├── achapter/
│   │   └── achapter.tex     # Additional chapter
│   └── conclusion/
│       └── conclusion.tex   # Conclusion chapter
├── macros/
│   └── packages.tex         # LaTeX package imports
├── style/
│   ├── unicamthesis.cls     # Main document class
│   └── listings-solidity-ocaml.sty  # Code listing styles
└── logos/                   # University logos
```

## Customization

### Adding a New Chapter

1. Create a new directory in `chapters/`:
   ```bash
   mkdir chapters/mychapter
   ```

2. Create a `.tex` file in that directory:
   ```bash
   touch chapters/mychapter/mychapter.tex
   ```

3. Add content to your chapter file:
   ```latex
   \section{Introduction}
   Your content here...
   
   \subsection{Subsection Title}
   More content...
   ```

4. Add the chapter to `main.tex`:
   ```latex
   \chapter{My Chapter Title}\label{chapter:mychapter}
   \input{./chapters/mychapter/mychapter}
   ```

### Modifying the Document Class

The main styling is defined in `style/unicamthesis.cls`. You can modify:
- Page margins and layout
- Font sizes and styles
- Chapter and section formatting
- Header and footer styles
- Title page layout

### Adding Packages

To add new LaTeX packages, edit `macros/packages.tex` and add your package imports there.

## Compiling

### Manual Compilation

For a complete compilation with bibliography:

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

The multiple `pdflatex` runs are necessary to resolve all cross-references and citations.

### Using latexmk (Recommended)

`latexmk` automatically handles multiple compilation passes:

```bash
latexmk -pdf main.tex
```

To clean auxiliary files:

```bash
latexmk -c
```

### Using an IDE

Most LaTeX editors (TeXstudio, TeXmaker, Overleaf, etc.) can compile the document automatically. Make sure to configure them to run BibTeX as well.

## Bibliography Management

### Adding References

1. Add entries to `bib.bib` in BibTeX format:
   ```bibtex
   @article{author2024title,
     title={Article Title},
     author={Author, Name},
     journal={Journal Name},
     volume={1},
     pages={1--10},
     year={2024}
   }
   ```

2. Cite references in your text:
   ```latex
   This is a reference \cite{author2024title}.
   ```

3. Compile with BibTeX (see Compiling section above).

### Bibliography Styles

Change the bibliography style in `main.tex`:
```latex
\bibliographystyle{plain}  % Options: plain, alpha, unsrt, etc.
```

## Writing Tips

### Cross-References

Use `\label` and `\cref` (from the `cleveref` package):

```latex
\section{Introduction}\label{sec:intro}
...
As discussed in \cref{sec:intro}...
```

### Figures

```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{path/to/figure.pdf}
  \caption{Figure caption}
  \label{fig:myfigure}
\end{figure}
```

### Tables

```latex
\begin{table}[h]
  \centering
  \begin{tabular}{|l|c|r|}
    \hline
    Header 1 & Header 2 & Header 3 \\
    \hline
    Data 1   & Data 2   & Data 3   \\
    \hline
  \end{tabular}
  \caption{Table caption}
  \label{tab:mytable}
\end{table}
```

### Algorithms

```latex
\begin{algorithm}
  \caption{Algorithm caption}
  \begin{algorithmic}[1]
    \State Do something
    \If{condition}
      \State Do this
    \EndIf
  \end{algorithmic}
\end{algorithm}
```

## Troubleshooting

### Missing Packages

If you get "Package not found" errors:
- Install the missing package using your LaTeX distribution's package manager
- Or download the package manually and place it in your TeX distribution's tree

### Citation Warnings

Citation warnings during editing are normal. They will be resolved after compiling with BibTeX.

### Page Breaks

To force a page break:
```latex
\newpage
```

To start a new page on the right side (for two-sided printing):
```latex
\cleardoublepage
```

### Compilation Errors

- Check for unmatched braces `{}` and brackets `[]`
- Ensure all `\begin{...}` have matching `\end{...}`
- Verify that all referenced files exist
- Check for special characters that need escaping (e.g., `%`, `$`, `&`)

## License

This template is provided as-is for use in writing theses at the University of Camerino. Modify as needed for your specific requirements.

## Contributing

If you find issues or have suggestions for improvements, please open an issue or submit a pull request.

## Support

For LaTeX-specific questions, consult:
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [TeX Stack Exchange](https://tex.stackexchange.com/)

For template-specific questions, refer to the comments in the source files or contact your thesis supervisor.
