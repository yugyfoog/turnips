

all: buyhist.pdf sellhist.pdf weeks.pdf


buyhist.pdf: buy.R turnips.csv
	Rscript buy.R

sellhist.pdf: sell.R turnips.csv
	Rscript sell.R

weeks.pdf: weeks.R turnips.csv
	Rscript weeks.R

clean:
	rm -f *~

