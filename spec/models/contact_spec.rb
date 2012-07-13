require "spec_helper"

describe Contact do

  before { @contact = Contact.new(name: "contact test",
                                  address: "address test",
                                  email: "contact_email@test.com") }

  subject { @contact }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:email) }
  it { should have_many(:phones) }

  it { should be_valid                              }
  it { should validate_presence_of :name            }
  it { should ensure_length_of(:name).is_at_most 40 }
  %w[
    user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com].each do |bad_email|
    it { should validate_format_of(:email).with(bad_email).with_message /email is invalid/ }
  end
end