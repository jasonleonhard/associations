class Post < ActiveRecord::Base
#   attr_accessible :content, :title, :text

  belongs_to :user, dependent: :destroy
  has_many :comments
end