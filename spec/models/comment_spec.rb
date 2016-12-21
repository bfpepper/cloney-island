require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Validations" do
    it { should validate_presence_of(:comment_body)}
  end

  context 'Relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:project)}
  end
end
