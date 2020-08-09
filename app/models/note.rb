class Note < ApplicationRecord

  # Relations:
  belongs_to :user, class_name: 'User', inverse_of: :notes

  has_rich_text :body


end
