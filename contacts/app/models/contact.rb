class Contact < ActiveRecord::Base
  has_many :favorites
  belongs_to :user

  attr_accessible :address, :email, :name, :phone_number, :user_id

  validates :address, :email, :name, :phone_number, :presence => true
  validates :address, :email, :name,
    :phone_number, :length => {:maximum => 255}
end
