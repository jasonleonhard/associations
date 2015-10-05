class Order < ActiveRecord::Base
    belongs_to :customer, dependent: :destroy
end