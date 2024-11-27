class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum gender: { male: "Male", female: "Female" }
end
