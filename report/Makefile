GRAPHS := $(shell ../scripts/mp-discover-graph-dependencies)
REAL_GRAPHS := $(GRAPHS:.plot=.tex) $(GRAPHS:.plot=.pdf)

.PHONY : clean show

report.pdf: report.tex $(REAL_GRAPHS) sections/*.tex
	@echo "Parsing .tex file - first pass"
	@-pdflatex -halt-on-error report.tex > /dev/null 2> /dev/null
	@# Run twice to resolve references
	@echo "Parsing .tex file again to resolve references"
	@-pdflatex -halt-on-error report.tex > /dev/null 2> /dev/null
	@# Run thrice to fix table of contents
	@echo "Parsing .tex file yet again to build table of contents"
	@pdflatex -halt-on-error report.tex \
		| sed -n '/hyperref\/hpdftex\.def$$/,$$p' \
		| (cat \
		| grep -v "^\[Loading" \
		| grep -v "^\*geometry\*" \
		| grep -v "./report.out" \
		| grep -v "\`h' float specifier changed to" \
		| grep -v "sections/" \
		| grep -v "graphs/" \
		| grep -v '^\[[0-9]' \
		| grep -v "^ )$$" \
		| awk '/see the transcript/{i++} /Output/{i--} (i-1)' \
		| grep -v "/usr/share/texmf-dist" \
		| grep -v ".pfb" \
		| grep -v "Transcript" \
		| grep -v '^$$'; :) # Because grep returns 1 on no matches...

show: report.pdf
	xdg-open report.pdf &

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
	@sed -i '/^set title/d' "$<.tmp"
	@# Make all lines solid
	@sed -i 's/ lt [^ ]*/ lt 1/' "$<.tmp"
	@gnuplot "$<.tmp"
	@rm "$<.tmp"
	
	@# Fix broken handling of multiple dots in filenames
	@# see http://tex.stackexchange.com/questions/10574/includegraphics-dots-in-filename
	@sed -i 's/\(\\put(0,0){\\includegraphics{\)\(graphs\/.*\.[^p].*\)}}/\1{\2}.pdf}}/' "graphs/$*.tex"

	@# Make graph fonts smaller
	@sed -i 's/\\makebox(0,0)\(.*\){\\strut{}\([^}]*\)}}%/\\makebox(0,0)\1{\\strut{}\\scriptsize{\2}}}%/' "graphs/$*.tex"

clean:
	rm -f report.{aux,log,out,pdf,toc}
	rm -f graphs/*.{tex,pdf,tmp,eps}
