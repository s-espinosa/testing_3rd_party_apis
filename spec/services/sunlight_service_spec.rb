require 'rails_helper'

describe SunlightService do
  attr_reader :service

  before(:each) do
    @service = SunlightService.new
  end

  describe "#legislators" do
    it "finds all female legislators" do
      VCR.use_cassette("find_female_legislators") do
        legislators = service.legislators(gender: "F")
        legislator  = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator[:first_name]).to eq('Liz')
        expect(legislator[:last_name]).to eq('Cheney')
      end
    end
  end

  describe '#committess' do
    it 'can find a list of committees by chamber' do
      VCR.use_cassette("find_list_of_committees") do
        committees = service.committees(chamber: 'senate')
        committee  = committees.first

        expect(committees.count).to eq(20)
        expect(committee[:name]).to eq('Federal Spending Oversight and Emergency Management')
      end
    end
  end
end
