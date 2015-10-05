class Business < ActiveRecord::Base
  has_many :interactions, as: :interactive
end