class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true, dependent: :destroy
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories
  accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :author, reject_if: :all_blank

  validate :must_have_at_least_one_category
  validates :textbody, presence: true

  private
  def must_have_at_least_one_category #Copilot assist with defining this method
    if quote_categories.reject(&:marked_for_destruction?).empty?
      errors.add(:base, "Quote must have at least one category.")
    end
  end

end
