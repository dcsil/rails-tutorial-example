class Membership < ApplicationRecord
  include Discard::Model
  belongs_to :user
  belongs_to :channel
end
