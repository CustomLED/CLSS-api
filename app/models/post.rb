class Post < ApplicationRecord
  belongs_to :admin

  has_one_attached :image, dependent: :purge
  validates :name, :text, presence: true
end
