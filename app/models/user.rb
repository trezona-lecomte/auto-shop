class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
end
