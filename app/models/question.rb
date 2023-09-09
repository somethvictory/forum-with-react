class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user

  has_many :answers

  def self.filter(query)
    where('title iLIKE ?', "%#{query}%")
  end
end
