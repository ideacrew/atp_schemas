require "spec_helper"

describe "An extended schema allowing additional referral activity reason codes" do
  let(:schema) { AtpSchemas::SchemaLoader.load_extended_schema }
  let(:validator) { AtpSchemas::Validator.new(schema) }
  let(:example_document) { Nokogiri::XML(document_string) }

  describe "in the 'vanilla' scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "in the 'vanilla' renewal scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
<me-atp:AdditionalReferralActivityReasonCode>Renewal</me-atp:AdditionalReferralActivityReasonCode>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "in the full determination scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
            <ReferralActivityReasonCode>FullDetermination</ReferralActivityReasonCode>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "in the full determination, renewal scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
            <ReferralActivityReasonCode>FullDetermination</ReferralActivityReasonCode>
            <me-atp:AdditionalReferralActivityReasonCode>Renewal</me-atp:AdditionalReferralActivityReasonCode>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "in the gap filling scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
            <ReferralActivityReasonCode>GapFilling</ReferralActivityReasonCode>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end

  describe "in the gap filling, renewal scenario" do
    let(:document_string) do
      <<-XMLCODE
        <InsuranceApplicant
          xmlns="http://hix.cms.gov/0.1/hix-ee"
          xmlns:hix-core="http://hix.cms.gov/0.1/hix-core"
          xmlns:niem-s="http://niem.gov/niem/structures/2.0"
          xmlns:me-atp="http://xmlns.coverme.gov/atp/hix-ee">
          <hix-core:RoleOfPersonReference niem-s:ref="roleid" niem-s:id="roleid"></hix-core:RoleOfPersonReference>
          <me-atp:ReferralActivity>
            <ReferralActivitySenderReference niem-s:ref="senderid" niem-s:id="senderid"/>
            <ReferralActivityReceiverReference niem-s:ref="receiverid" niem-s:id="receiverid" />
            <ReferralActivityStatus>
              <ReferralActivityStatusCode>Initiated</ReferralActivityStatusCode>
            </ReferralActivityStatus>
            <ReferralActivityReasonCode>GapFilling</ReferralActivityReasonCode>
            <me-atp:AdditionalReferralActivityReasonCode>Renewal</me-atp:AdditionalReferralActivityReasonCode>
          </me-atp:ReferralActivity>
        </InsuranceApplicant>
      XMLCODE
    end

    it "is valid against the extended schema" do
      expect(validator.validate(example_document).errors).to eq []
    end
  end
end
