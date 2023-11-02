class Option < ApplicationRecord
  belongs_to :command
  has_many :translations, as: :translatable, dependent: :destroy
end