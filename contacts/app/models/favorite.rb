class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact

  attr_accessible :contact_id, :user_id

  validates :contact_id, :user_id, :presence => true
end
