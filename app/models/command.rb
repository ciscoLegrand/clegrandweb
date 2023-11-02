class Command < ApplicationRecord
  belongs_to :parent, class_name: 'Command', optional: true
  has_many :subcommands, class_name: 'Command', foreign_key: :parent_id, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :translations, as: :translatable, dependent: :destroy
end