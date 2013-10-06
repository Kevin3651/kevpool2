class Ride < ActiveRecord::Base
validates_presence_of :Starting_From, :Going_to, :depart, :Price, :Seats
belongs_to :users
validates :Seats, :numericality => true
  validates :Price, :numericality => true
has_many :requests, :dependent => :destroy
default_scope -> { order('depart DESC') }

  def self.prune_records
    @Rides = Ride.all
    for r in @Rides
      if r.expires < Datetime.now
        r.delete
      end
    end
  end

end
