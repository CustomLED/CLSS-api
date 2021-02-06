class Post < ApplicationRecord
  belongs_to :admin
  validates :name, :text, presence: true
  # has_one_attached :image, dependent: :purge
end
