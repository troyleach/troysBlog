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
#

class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  has_attached_file :image, :default_url => "ohno.gif", :style => 'width: 100px'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  before_validation { image.clear if @delete_image }

  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image = !value.to_i.zero?
  end
end
