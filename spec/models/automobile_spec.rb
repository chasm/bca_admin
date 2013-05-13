require 'spec_helper'

describe Automobile do
  subject(:auto) { create(:automobile) }
  let!(:name) { [auto.year, auto.make, auto.model].compact.join(" ") }
  
  it "has a valid factory" do
    create(:automobile).should be_valid
  end
  
  it "is invalid without a stock number" do
    expect(build(:automobile, stock_number: nil)).not_to be_valid
  end
  
  it "is invalid without a year" do
    expect(build(:automobile, year: nil)).not_to be_valid
  end
  
  it "is invalid without a make" do
    expect(build(:automobile, make: nil)).not_to be_valid
  end
  
  it "is invalid without a model" do
    expect(build(:automobile, model: nil)).not_to be_valid
  end
  
  it "is invalid without a color" do
    expect(build(:automobile, color: nil)).not_to be_valid
  end
  
  it "is invalid without a style" do
    expect(build(:automobile, style: nil)).not_to be_valid
  end
  
  it "is invalid without a price" do
    expect(build(:automobile, price: nil)).not_to be_valid
  end
  
  it "is invalid without a status" do
    expect(build(:automobile, status: nil)).not_to be_valid
  end
  
  it "does not permit duplicate stock numbers" do
    create(:automobile, stock_number: "x")
    expect(build(:automobile, stock_number: "x")).not_to be_valid
  end
  
  it "is invalid with a year less than #{Automobile.first_year}" do
    expect(build(:automobile, year: (Automobile.first_year - 1))).not_to be_valid
  end
  
  it "is invalid with a year greater than #{Automobile.next_year}" do
    expect(build(:automobile, year: (Automobile.next_year + 1))).not_to be_valid
  end
  
  it "is invalid with a price less than #{Automobile.min_price}" do
    expect(build(:automobile, price: (Automobile.min_price - 1))).not_to be_valid
  end
  
  it "is invalid with a price greater than #{Automobile.max_price}" do
    expect(build(:automobile, price: (Automobile.max_price + 1))).not_to be_valid
  end
  
  it "is valid when the style is one of #{Automobile.styles.join(", ")}" do
    Automobile.styles.each do |style|
      expect(build(:automobile, style: style)).to be_valid
    end
  end
  
  it "does not permit a style not one of #{Automobile.styles.join(", ")}" do
    expect(build(:automobile, style: "grizmo")).not_to be_valid
  end
  
  it "is valid when the status is one of #{Automobile.statuses.join(", ")}" do
    Automobile.statuses.each do |status|
      expect(build(:automobile, status: status)).to be_valid
    end
  end
  
  it "does not permit a status not one of #{Automobile.statuses.join(", ")}" do
    expect(build(:automobile, status: "grizmo")).not_to be_valid
  end
  
  its(:name) {should eq name }
end