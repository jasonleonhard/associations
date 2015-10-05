class Comment < ActiveRecord::Base
#   attr_accesssible :body, :post           # allow access from post

  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
end