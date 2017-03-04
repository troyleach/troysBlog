# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  category_id        :integer
#  user_id            :integer
#  tags               :text
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime

FactoryGirl.define do
  factory :user do
    name 'troy leach'
    email 'troy@email.com'
    password 'password'
  end
end
