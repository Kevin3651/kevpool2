class Profile < ActiveRecord::Base
validates_presence_of :cell
belongs_to :users
end
