class User < ApplicationRecord
	after_create :complete_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy
  has_many :places, dependent: :destroy

  acts_as_voter

  def is_admin?
  	return self.admin
  end

  def complete_user
  	Profile.create(user_id: self.id)
  	Account.create(user_id: self.id)
  end

  def has_locations?
    self.places.any?
  end

  def fullname
    self.firstname + " " + self.lastname
  end

  def firstname
    self.profile.firstname
  end

  def lastname
    self.profile.lastname
  end
end
