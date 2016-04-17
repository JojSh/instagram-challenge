class Comment < ActiveRecord::Base

  belongs_to :picture, dependent: :destroy

end
