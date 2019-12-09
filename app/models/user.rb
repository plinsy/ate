class User < ApplicationRecord
	after_create :complete_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy
  has_many :places, dependent: :destroy

  def is_admin?
  	return self.admin
  end

  def complete_user
  	Profile.create(user_id: self.id)
  	Account.create(user_id: self.id)
  end
end
