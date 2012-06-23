require "spec_helper"

describe Phone do

  before { @phone = Phone.new(number: "123-4567890", phone_type: "home", contact_id: 1) }

  subject { @phone }

  it { should respond_to(:number) }
  it { should respond_to(:phone_type) }
  it { should respond_to(:contact_id) }
  it { should respond_to(:contact) }

  it { should be_valid }
end
