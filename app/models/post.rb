class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :users
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
