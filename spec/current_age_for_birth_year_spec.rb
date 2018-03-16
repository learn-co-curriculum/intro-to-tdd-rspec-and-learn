require_relative '../current_age_for_birth_year.rb'

describe "current_age_for_birth_year method" do
  it "returns the age of a person based on the year of birth" do
    now = Time.new("2018-01-01 13:00:00")
    allow(Time).to receive(:now) { now }
    age_of_person = current_age_for_birth_year(1998)

    expect(age_of_person).to eq(20)
  end
end
