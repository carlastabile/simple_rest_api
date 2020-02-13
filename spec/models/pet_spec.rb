require 'rails_helper'

RSpec.describe Pet, type: :model do
  subject { described_class.new }
  let(:hooman){ User.new(username: "carla") }

  # this block executes before each test, so for each test it sets the user of
  # the subject to the variable hooman
  before do
    subject.user = hooman
  end
  it "is valid with valid attributes" do
    subject.name = "dasha"
    subject.kind = "dog"
    subject.age_in_years = 4
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.kind = "dog"
    subject.age_in_years = 4
    expect(subject).to_not be_valid
  end

  it "is not valid if kind not dog, cat or fish" do
    subject.name = "dasha"
    subject.kind = "bear"
    expect(subject).to_not be_valid
  end

  it "is not valid with age less than 0 years" do
    subject.name = "dasha"
    subject.age_in_years = -1
    expect(subject).to_not be_valid
    end
end
