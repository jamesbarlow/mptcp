GRAPHS := mp-int-2.4-i mp-int-2.4-ni
GRAPHS_WD := $(addprefix graphs/,$(GRAPHS))
REAL_GRAPHS := $(addsuffix .pdf,$(GRAPHS_WD)) $(addsuffix .tex,$(GRAPH_SWD))

.PHONY : clean show

show: report.pdf
	xdg-open report.pdf

report.pdf: report.tex $(REAL_GRAPHS)
	@pdflatex -halt-on-error report.tex
	@# Run twice to resolve references
	pdflatex -halt-on-error report.tex > /dev/null

graphs/%.pdf: graphs/%.eps
	@echo "Generating $@ from EPS"
	@ps2pdf -dEPSCrop "$<" "$@" > /dev/null

graphs/%.tex graphs/%.eps: graphs/%.plot
	@echo "Ensuring all data sources have been analyzed"
	@$(realpath ../scripts/mp-graph-analyze-dependencies) "$<"
	@echo "Destyling and LaTeXifying $<"
	@cp "$<" "$<.tmp"
	@sed -i '/^plot/i \
	set terminal epslatex \
	set output "graphs/$*.tex"' "$<.tmp"
	@sed -i '/^set style/d' "$<.tmp"
	@sed -i '/^set title/d' "$<.tmp"
	@sed -i 's/ ls [^,]*//' "$<.tmp"
	@gnuplot "$<.tmp"
	@rm "$<.tmp"
	
	@# Fix broken handling of multiple dots in filenames
	@# see http://tex.stackexchange.com/questions/10574/includegraphics-dots-in-filename
	@sed -i 's/\(\\put(0,0){\\includegraphics{\)\(graphs\/.*\.[^p].*\)}}/\1{\2}.pdf}}/' graphs/$*.tex

clean:
	rm -f report.{aux,log,out,pdf}
	rm -f graphs/*.{tex,pdf}
