class Command < ApplicationRecord
  # add a validation uniqueness for the tech, command, flag
  validates :tech, uniqueness: { scope: [:command, :flag] }
end
