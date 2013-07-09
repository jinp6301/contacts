class User < ActiveRecord::Base
  has_many :contacts
  has_many :favorites
  has_many :favorite_contacts, :through => :favorites, :source => :contact

  attr_accessible :email, :name, :password

  validates :name, :email, :password, :presence => true
  validates :email, :uniqueness => true
end
