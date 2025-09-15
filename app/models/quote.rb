class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories
end
