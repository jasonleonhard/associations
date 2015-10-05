class Interaction < ActiveRecord::Base
  belongs_to :interactive, polymorphic: true
end
