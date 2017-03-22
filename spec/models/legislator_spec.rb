require 'rails_helper'

describe Legislator do
  describe '#find_by' do
    it 'finds legislators by gender' do
      VCR.use_cassette('models/find_female_legislators') do
        legislators = Legislator.find_by(gender: 'F')
        legislator  = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator.class).to eq(Legislator)
        expect(legislator.first_name).to eq("Liz")
        expect(legislator.last_name).to eq("Cheney")
      end
    end
  end
end

