class Note < ApplicationRecord

  # Trix ActionText
  has_rich_text :body

  # Relations:
  belongs_to :user, class_name: 'User', inverse_of: :notes

  # Validations:


  # Scopes:
  scope :visible_by, ->(user) {
    where(user_id: user)
  }

end
