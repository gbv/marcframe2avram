This git repository includes a [jq] script to convert the KB/LIBRIS mappings of MARC to RDF vocabulary terms ([MARCFrame]) into an [Avram Schema]).

## Requirements

* [jq]
* make
* wget

## Usage

Just execute the `Makefile` via

    make

to generate [Avram Schema] files `bib.schema.json`, `auth.schema.json`, and `hold.schema.json`.

The processed MARC to RDF mapping is downloaded from <https://github.com/libris/librisxl/blob/develop/whelk-core/src/main/resources/ext/marcframe.json>.

[jq]: https://stedolan.github.io/jq/
[MARCFrame]: https://id.kb.se/marcframe/
[Avram Schema]: https://format.gbv.de/schema/avram/specification
