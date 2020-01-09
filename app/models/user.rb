class User < ApplicationRecord
  include PublicActivity::Model
  tracked
  
	after_create :complete_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :services, through: :places, dependent: :destroy

  acts_as_voter

  def is_admin?
  	return self.admin
  end
  
  def has?(item)
    return item.user.id == self.id
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

  def avatar
    self.profile.avatar
  end

  def commented?(commentable_id)
    Comment.where(user_id: self.id, commentable_id: commentable_id).any?
  end
end
