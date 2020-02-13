require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.username = "foobar"
    subject.password = "123456..."
    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    subject.password = "123456789"
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.username = "foobar"
    expect(subject).to_not be_valid
  end

  it "is not valid with password less than 6 chars" do
    subject.password = "123"
    subject.username = "foobar"
    expect(subject).to_not be_valid
  end
end