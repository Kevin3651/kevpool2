class Ride < ActiveRecord::Base
validates_presence_of :I_am, :Starting_From, :Going_to, :depart, :Price, :Seats
belongs_to :users
has_many :requests, :dependent => :destroy
default_scope -> { order('depart DESC') }
end
