class Note < ApplicationRecord

  # Trix ActionText
  has_rich_text :body

  # Relations:
  belongs_to :user, class_name: 'User', inverse_of: :notes
  has_one :action_text_rich_text,
          class_name: 'ActionText::RichText',
          as: :record

  # Validations:
  validates :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :body, length: {
    maximum: 1000,
    tokenizer: lambda { |str| str.scan(/./) }
  }

  # Scopes:
  scope :visible_by, ->(user) {
    where(user_id: user)
  }

end
