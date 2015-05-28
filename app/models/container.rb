class Container < ActiveRecord::Base
  belongs_to :user
  belongs_to :container_type
  has_many :items
end
