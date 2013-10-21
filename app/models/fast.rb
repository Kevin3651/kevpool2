class Fast < ActiveRecord::Base
	has_many :request2s, :dependent => :destroy
	belongs_to :users
end
