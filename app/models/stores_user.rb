# frozen_string_literal: true

class StoresUser < ApplicationRecord
  belongs_to :store
  belongs_to :user
end
