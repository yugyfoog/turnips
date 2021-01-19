

all: buyhist.pdf sellhist.pdf weeks.pdf recommend.pdf

buyhist.pdf: buy.R turnips.csv
	Rscript buy.R

sellhist.pdf: sell.R turnips.csv
	Rscript sell.R

weeks.pdf: weeks.R weekpoint.R turnips.csv
	Rscript weeks.R

recommend.pdf: recommend.R recommend.tex turnips.csv
	Rscript recommend.R
	pdflatex -interaction nonstopmode -file-line-error recommend.tex
	rm recommendtable.tex

clean:
	rm -f *~ *.aux *.log

