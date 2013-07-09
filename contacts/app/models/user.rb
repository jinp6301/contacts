class User < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorite_contacts, :through => :favorites, :source => :contact,
    :dependent => :destroy

  attr_accessible :email, :name, :password

  validates :name, :email, :password, :presence => true
  validates :email, :uniqueness => true
end
