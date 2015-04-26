class User < ActiveRecord::Base
  has_many :sessions, inverse_of: :user, dependent: :destroy
end