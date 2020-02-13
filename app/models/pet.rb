class Pet < ApplicationRecord
  belongs_to :user
  # If for some reason we want to rename the association, this is the way to do it
  # belongs_to :hooman, class_name: "User", foreign_key: :user_id

  # Validate the model fields
  validates :name, presence: true
  validates :kind, inclusion: { in: %w(dog cat fish),
                                message: "%{value} is not a valid pet kind :(" }, allow_nil: true
  validates :age_in_years, numericality: { greater_than_or_equal_to: 0 }
end
