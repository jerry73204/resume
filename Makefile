.PHONY: all clean

all: resume.html resume.pdf

resume.html: resume.adoc
	asciidoctor -a data-uri -a stem=latexmath -b html resume.adoc

resume.pdf: resume.html
	wkhtmltopdf resume.html resume.pdf

clean:
	rm -f resume.html
	rm -f resume.pdf
	rm -f *.png
	rm -f *.svg
