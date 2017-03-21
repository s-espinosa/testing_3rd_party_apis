require 'rails_helper'

describe Committee do
  describe '#find_by' do
    it "returns committees by chamber" do
      committees = Committee.find_by(chamber: 'senate')
      committee  = committees.first

      expect(committees.count).to eq(20)
      expect(committee.class).to eq(Committee)
      expect(committee.name).to eq('Federal Spending Oversight and Emergency Management')
    end
  end
end

