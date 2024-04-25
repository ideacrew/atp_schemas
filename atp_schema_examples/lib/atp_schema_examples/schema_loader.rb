require "nokogiri"

module AtpSchemaExamples
  class SchemaLoader
    EXTENDED_SCHEMA_PATH = File.join(
      File.dirname(__FILE__),
      "../../../",
      "XSD/XMLSchemas/unconstrained/exchange/SBM.xsd"
    )

    def self.load_extended_schema
      Nokogiri::XML::Schema.new(File.open(EXTENDED_SCHEMA_PATH,"rb"))
    end
  end
end
