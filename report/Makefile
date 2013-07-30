.PHONY : clean %.graph
.PRECIOUS : graphs/%.pdf

report.pdf: report.tex
#            graphs/my-graph.pdf
	sed -i 's/includegraphics{/includegraphics{graphs\//' graphs/*.tex
	sed -i 's/includegraphics{graphs\/graphs\//includegraphics{graphs\//' graphs/*.tex
	pdflatex report.tex
	pdflatex report.tex # Run twice to resolve references

%.graph: graphs/%.pdf graphs/%.tex
	@

graphs/%.pdf: graphs/%.eps
	ps2pdf -dEPSCrop $< $@

graphs/%.tex graphs/%.eps: graphs/%.plot
	sed -i '/^plot/i \
	set terminal epslatex \
	set output "graphs/$*.tex"' $<
	gnuplot $<
	sed -i '/^set terminal/d' $<
	sed -i '\|^set output "graphs/$*.tex"|d' $<

clean:
	rm -f report.{aux,log,out,pdf}
	rm -f graphs/*.{tex,pdf}
