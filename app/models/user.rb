# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :stores, through: => :stores_users
end
