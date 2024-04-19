# Makefile

# Default target
all:
	@if [ -z "$(BASENAME)" ]; then \
	for x in *.md; do\
		make "$${x%.md}.html" "$${x%.md}.docx" "$${x%.md}.txt"; \
		done; \
	else \
		make $(BASENAME).html $(BASENAME).docx $(BASENAME).txt; \
	fi

# Rules to build the various formats, assuming BASENAME is given
%.html: %.md
	pandoc -s -o $@ $<

%.docx: %.md
	pandoc -s -o $@ $<

%.txt: %.md
	pandoc -s -o $@ $<

# Dummy rule to avoid "No rule to make target" error for a non-file target
%:
	@:

.PHONY: all clean

# Clean rule to delete the generated files
clean:
	rm -f *.html *.docx *.txt
