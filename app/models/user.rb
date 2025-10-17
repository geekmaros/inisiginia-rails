class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  # before_create :skip_confirmation_in_dev
  #
  # private
  #
  # def skip_confirmation_in_dev
  #   skip_confirmation! if Rails.env.development?
  # end
end
