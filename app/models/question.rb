class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user

  has_many :answers
  has_many :question_tags, class_name: 'QuestionTags'
  has_many :tags, through: :question_tags

  def self.filter(query)
    where('title iLIKE ?', "%#{query}%")
  end
end
