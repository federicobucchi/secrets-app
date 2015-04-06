class User < ActiveRecord::Base
  has_many :secrets, dependent: :destroy
end
