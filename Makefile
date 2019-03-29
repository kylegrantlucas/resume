current_dir = $(shell pwd)
CC=docker run -v $(current_dir)\:/data kylegrantlucas/latex-docker

# Setup our build step it will do 3 things:
#   1. Ensure the output folder exists
#   2. Compile the HTML output with the given theme using `resume`
#   3. Export the final PDF from the HTML output using `wkhtmltopdf`
.PHONY: build
build:
		mkdir -p output
		resume-exporter -t classic -o output/kyle_classic.tex
		resume-exporter -t modern -o output/kyle_modern.tex
		$(CC) xelatex -interaction nonstopmode -output-dir=/data/output /data/output/kyle_classic.tex
		$(CC) xelatex -interaction nonstopmode -output-dir=/data/output /data/output/kyle_modern.tex

.PHONY: clean
clean:
		rm -rf output