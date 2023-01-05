all: bezier5.pdf

bezier5.pdf: bezier5.tex bezier5.mp
	mpost bezier5.mp
	pdflatex bezier5.tex
	pdflatex bezier5.tex

clean:
	rm *.log *.aux
