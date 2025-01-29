require "spec_helper"

describe "An extended schema allowing additional DHS-SVEVerification and FFEVerification codes" do
  let(:schema) { AtpSchemas::SchemaLoader.load_extended_schema }
  let(:validator) { AtpSchemas::Validator.new(schema) }
  let(:example_document) { Nokogiri::XML(document_string) }

  describe "testing DHS-SAVEVerificationCode scenario" do
    let(:document_string) do
      <<-XMLCODE
        <hix-core:VerificationMetadata 
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:niem-core="http://niem.gov/niem/niem-core/2.0">
          <hix-core:DHS-SAVEVerificationCode>15</hix-core:DHS-SAVEVerificationCode>
          <hix-core:VerificationAuthorityName>ME</hix-core:VerificationAuthorityName>
          <hix-core:VerificationDate>
            <niem-core:DateTime>2021-08-19T13:58:03-04:00</niem-core:DateTime>
          </hix-core:VerificationDate>
          <hix-core:VerificationRequestingSystem>
            <hix-core:InformationExchangeSystemCategoryCode>Exchange</hix-core:InformationExchangeSystemCategoryCode>
          </hix-core:VerificationRequestingSystem>
          <hix-core:VerificationIndicator>true</hix-core:VerificationIndicator>
          <hix-core:VerificationDescriptionText>Transfer</hix-core:VerificationDescriptionText>
          <hix-core:VerificationStatus>
            <hix-core:VerificationStatusCode>1</hix-core:VerificationStatusCode>
          </hix-core:VerificationStatus>
        </hix-core:VerificationMetadata>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "testing FFEVerificationCode scenario" do
    let(:document_string) do
      <<-XMLCODE
        <hix-core:VerificationMetadata 
        xmlns="http://hix.cms.gov/0.1/hix-ee"
        xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
        xmlns:niem-s="http://niem.gov/niem/structures/2.0"
        xmlns:niem-core="http://niem.gov/niem/niem-core/2.0">
        <hix-core:FFEVerificationCode>X</hix-core:FFEVerificationCode>
        <hix-core:VerificationAuthorityName>ME</hix-core:VerificationAuthorityName>
        <hix-core:VerificationDate>
            <niem-core:DateTime>2021-08-19T13:58:03-04:00</niem-core:DateTime>
        </hix-core:VerificationDate>
        <hix-core:VerificationRequestingSystem>
            <hix-core:InformationExchangeSystemCategoryCode>Exchange</hix-core:InformationExchangeSystemCategoryCode>
        </hix-core:VerificationRequestingSystem>
        <hix-core:VerificationIndicator>true</hix-core:VerificationIndicator>
        <hix-core:VerificationDescriptionText>Transfer</hix-core:VerificationDescriptionText>
        <hix-core:VerificationStatus>
            <hix-core:VerificationStatusCode>1</hix-core:VerificationStatusCode>
        </hix-core:VerificationStatus>
        </hix-core:VerificationMetadata>
      XMLCODE
    end  

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end
end
