class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable, :confirmable

validates :first_name,presence: true,:on => :create
validates :last_name,presence: true,:on => :create    

has_many :orders 
      
end
