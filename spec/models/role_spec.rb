require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'Relationships' do
    it 'has many users' do
      role = build(:role)

      expect(role).to respond_to(:users)
    end
  end
end
