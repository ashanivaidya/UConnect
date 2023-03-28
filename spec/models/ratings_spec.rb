
require 'rails_helper'
require 'spec_helper'

RSpec.describe Rating, type: :model do
  describe 'Calculating ratings' do
    it 'should calculate the average' do
      expect(Rating.average(0)).not_to eq(nil)
    end
    it 'should calculate the number of ratings' do
      expect(Rating.number(0)).not_to eq(nil)
    end
  end
end

