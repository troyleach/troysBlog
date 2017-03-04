require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'testing assocciations' do
    it { should belong_to(:commentable) }
    it { should have_many(:comments) }

    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:post_id).of_type(:integer) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

end
