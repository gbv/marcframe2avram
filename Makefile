default: bib.schema.json auth.schema.json hold.schema.json

SCRIPT=marcframe2avram.jq

bib.schema.json: marcframe.json $(SCRIPT)
	jq --arg type bib -f $(SCRIPT) $< > $@

auth.schema.json: marcframe.json $(SCRIPT)
	jq --arg type auth -f $(SCRIPT) $< > $@

hold.schema.json: marcframe.json $(SCRIPT)
	jq --arg type hold -f $(SCRIPT) $< > $@

marcframe.json:
	wget -N https://github.com/libris/librisxl/raw/develop/whelk-core/src/main/resources/ext/marcframe.json
