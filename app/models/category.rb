# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
