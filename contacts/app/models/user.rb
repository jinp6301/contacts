class User < ActiveRecord::Base
  has_many :contacts
  has_many :favorites

  attr_accessible :email, :name

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end
