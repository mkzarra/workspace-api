# frozen_string_literal: true

class StoresUser < ApplicationRecord
  belongs_to :store
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :store_id
end
