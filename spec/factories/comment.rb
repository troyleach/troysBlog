# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  name             :string
#  email            :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  post_id          :integer
#  commentable_id   :integer
#  commentable_type :string

FactoryGirl.define do
  factory :comment do
    name 'fake name'
    email 'fake@email.com'
    body 'This is the body of the comment'
  end
end
