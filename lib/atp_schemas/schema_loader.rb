require "nokogiri"

module AtpSchemas
  class SchemaLoader
    EXTENDED_SCHEMA_PATH = File.join(
      File.dirname(__FILE__),
      "../../",
      "XSD/XMLSchemas/constraint/exchange/SBM.xsd"
    )

    def self.load_extended_schema
      Nokogiri::XML::Schema.new(File.open(EXTENDED_SCHEMA_PATH,"rb"))
    end
  end
end
