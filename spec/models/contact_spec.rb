require "spec_helper"

describe Contact do

  before { @contact = Contact.new(name: "contact test", address: "address test", email: "contact_email@test.com") }

  subject { @contact }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @contact.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @contact.name = "test" * 60 }
    it { should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      bad_emails = %w[user@foo,com user_at_foo.org 
                      example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      bad_emails.each do |bad_mail|
        @contact.email = bad_mail
        @contact.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      god_emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      god_emails.each do |god_mail|
        @contact.email = god_mail
        @contact.should be_valid
      end
    end
  end
end
