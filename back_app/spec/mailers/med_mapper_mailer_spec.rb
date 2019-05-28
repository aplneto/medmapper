require "rails_helper"

RSpec.describe MedMapperMailer, type: :mailer do
  describe "welcome" do
    let(:mail) { MedMapperMailer.welcome }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "contact_us" do
    let(:mail) { MedMapperMailer.contact_us }

    it "renders the headers" do
      expect(mail.subject).to eq("Contact us")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "violation" do
    let(:mail) { MedMapperMailer.violation }

    it "renders the headers" do
      expect(mail.subject).to eq("Violation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
