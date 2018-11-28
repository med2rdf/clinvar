# load data model dynamically
model = ClinVar::XML::XSD.open(ClinVar::RDF::SCHEMA_XSD) { |xsd| xsd.to_ruby }
STDERR.puts "Loading XML Schema: #{File.basename(ClinVar::RDF::SCHEMA_XSD)}"

eval(model)
