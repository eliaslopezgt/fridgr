class Container < ActiveRecord::Base
  belongs_to :user
  has_one :container_type
end
