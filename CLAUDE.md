# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal resume repository that uses Org-mode format to generate HTML and PDF versions of a resume. The resume is written in `resume.org` and uses Emacs org-mode export to compile to HTML and wkhtmltopdf to convert to PDF.

## Build Commands

### Generate all formats
```bash
make all
```

### Generate HTML only
```bash
make resume.html
# or directly:
emacs --batch --eval "(require 'ox-html)" --visit=resume.org --funcall org-html-export-to-html
```

### Generate PDF directly from Org-mode
```bash
make resume.pdf
# or directly (using XeLaTeX for Unicode support):
emacs --batch --eval "(progn (require 'ox-latex) (setq org-latex-pdf-process '(\"xelatex -interaction nonstopmode -output-directory %o %f\" \"xelatex -interaction nonstopmode -output-directory %o %f\" \"xelatex -interaction nonstopmode -output-directory %o %f\")))" --visit=resume.org --funcall org-latex-export-to-pdf
```

### Clean generated files
```bash
make clean
```

## Project Structure

- `resume.org` - Main resume content in Org-mode format
- `resume.adoc` - Legacy AsciiDoc format (kept for reference)
- `Makefile` - Build automation for generating HTML and PDF
- `images/` - Contains profile image and GitHub logo
- `icons/` - Directory for icons
- `resume.html` - Generated HTML output
- `resume.pdf` - Generated PDF output

## Dependencies

- **emacs** - Required for converting Org-mode to HTML and PDF (with org-mode package)
- **texlive** or similar LaTeX distribution - Required for PDF generation through org-mode's LaTeX export
- **xelatex** - Required for proper Unicode character support (included in most LaTeX distributions)

## Org-mode Configuration

The resume uses Org-mode export features:
- Custom HTML styling embedded in the document
- Link syntax for external references
- Structured headings and lists
- Bold and italic text formatting