require 'rails_helper'

RSpec.describe Pledge, type: :model do

  context "Relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end

  context 'validations' do
    it { should validate_presence_of(:amount_given) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:project) }
  end
  
end
