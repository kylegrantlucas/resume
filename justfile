# resume justfile

# Default recipe - build all resumes
default: build

# Build both resume templates
build:
    mkdir -p output
    resume-exporter resume.json -o output/kyle_modern.pdf -t modern
    resume-exporter resume.json -o output/kyle_classic.pdf -t classic
    @echo "Generated output/kyle_modern.pdf and output/kyle_classic.pdf"

# Build only modern template
modern:
    mkdir -p output
    resume-exporter resume.json -o output/kyle_modern.pdf -t modern
    @echo "Generated output/kyle_modern.pdf"

# Build only classic template
classic:
    mkdir -p output
    resume-exporter resume.json -o output/kyle_classic.pdf -t classic
    @echo "Generated output/kyle_classic.pdf"

# Clean output directory
clean:
    rm -rf output

# Open generated PDFs (macOS)
open:
    open output/*.pdf
