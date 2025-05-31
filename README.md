
# UNICAM Thesis Template

This repository contains a LaTeX template for PhD theses at the University of Camerino (UNICAM), designed to meet formatting requirements and integrate features such as custom title pages, declarations, lists, figures, FSM diagrams, bibliographies, and colophon.

## 📁 Files Included

- `unicamthesis.cls` — The custom class file defining the thesis layout and style.
- `main.tex` — A complete 5-page example thesis using the class and showing all features.
- `bib.bib` — A BibTeX file with example references.

## ✅ Features Demonstrated

- Custom title page with logos and metadata fields
- Abstract and declaration environments
- Table of contents, list of figures, tables, and algorithms
- FSM diagram using TikZ
- Theorem-like environments: `definition`, `example`
- Citations with BibTeX
- Custom `\printcolophon` command with default or user-defined funding note

## 🚀 How to Compile

To build the example thesis (`main.tex`), run:

```bash
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

Ensure the following are in the same directory:
- `unicamthesis.cls`
- `main.tex`
- `references.bib`

## ✍️ Customization

You can define the metadata like this before `\begin{document}`:

```latex
\title{My Thesis Title}
\author{Author Name}
\coursename{PhD Program}
\curriculumname{Curriculum Name}
\cyclenumber{XXXVIII}
\supervisorname{Prof. Supervisor}
\cosupervisorname{Prof. Co-supervisor}
\coordinatorname{Prof. Coordinator}
\dateofaward{2025}
```

## 🖋 Adding a Colophon

At the end of your thesis, insert:

```latex
\printcolophon
```

Or, to provide a custom note:

```latex
\printcolophon[This thesis was supported by ...]
```

---

Happy Writing! 📝
