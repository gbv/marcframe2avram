
def map_subfield:
  select( .key|match("^\\$.") ) |
  select(.value.ignored!=true) |
  .key[1:] as $code |
  {
    key: $code,
    value: {
      code: $code
    }
  }
;

def map_field:
  select(.key|match("^[0-9]{3}$")) |
  select(.value.ignored!=true) |
  {
    key,
    value: {
      tag: .key,
      subfields: .value|with_entries(map_subfield)
    }
  }
;

# Avram Schema
{
  "$schema": "https://format.gbv.de/schema/avram/schema.json",
  description: "KB/LIBRIS MARC \($type) records with parts that are mapped to RDF",
  url: "https://id.kb.se/marcframe/",
  fields: .[$type]|with_entries(map_field)
}
