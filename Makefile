

all: buyhist.pdf sellhist.pdf weeks.pdf recommend.pdf better.pdf byweek.pdf

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

better.pdf: better.R better.tex turnips.csv
	Rscript better.R
	pdflatex -interaction nonstopmode -file-line-error better.tex
	rm bettertable.tex

byweek.pdf: byweek.R weekpoint.R turnips.csv
	Rscript byweek.R

clean:
	rm -f *~ *.aux *.log

