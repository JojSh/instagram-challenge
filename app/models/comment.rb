class Comment < ActiveRecord::Base

  belongs_to :picture, dependent: :destroy
  validates :thoughts, length: {minimum: 2}, uniqueness: true

end
