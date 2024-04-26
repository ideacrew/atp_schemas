require "spec_helper"

describe "The ATP schema extended for SBMs" do
  let(:schema_path) do
    File.join(
      File.dirname(__FILE__),
      "../../",
      "XSD/XMLSchemas/constraint/exchange/SBM.xsd"
    )
  end

  it "is a valid XML schema" do
    expect(AtpSchemas::SchemaChecker.validate_schema(schema_path).errors).to eq []
  end
end
