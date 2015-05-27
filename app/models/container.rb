class Container < ActiveRecord::Base
  belongs_to :user
  belongs_to :container_type
end
