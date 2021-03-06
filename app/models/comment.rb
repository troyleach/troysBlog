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
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :email, presence: true

end
