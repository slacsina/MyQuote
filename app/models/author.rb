class Author < ApplicationRecord
    has_many :quotes, dependent: :nullify
    validates :birthyear, numericality: { only_integer: true }, allow_nil: true
end
