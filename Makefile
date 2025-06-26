.PHONY: all clean watch

all: resume.html resume.pdf

resume.html: resume.org
	emacs --batch --eval "(require 'ox-html)" --visit=resume.org --funcall org-html-export-to-html

resume.pdf: resume.org
	emacs --batch --eval "(progn (require 'ox-latex) (setq org-latex-pdf-process '(\"xelatex -interaction nonstopmode -output-directory %o %f\" \"xelatex -interaction nonstopmode -output-directory %o %f\" \"xelatex -interaction nonstopmode -output-directory %o %f\")))" --visit=resume.org --funcall org-latex-export-to-pdf

clean:
	rm -f resume.html
	rm -f resume.pdf
	rm -f resume.tex
	rm -f resume.log
	rm -f resume.aux
	rm -f resume.out
	rm -f resume.toc
	rm -f resume.lof
	rm -f resume.lot
	rm -f resume.fls
	rm -f resume.fdb_latexmk
	rm -f resume.synctex.gz
	rm -f resume.bbl
	rm -f resume.blg

watch:
	@echo "Watching resume.org for changes. Press Ctrl+C to stop."
	@while true; do \
		inotifywait -e modify resume.org 2>/dev/null || fswatch -1 resume.org 2>/dev/null; \
		echo "Detected change in resume.org, rebuilding HTML..."; \
		make resume.html; \
		echo "HTML rebuild complete."; \
	done
