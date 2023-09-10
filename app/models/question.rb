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

  def as_json
    json = super
    json[:created_at] = created_at.strftime("%m/%d/%Y %I:%M%p")
    json[:answers_count] = answers_count.to_i
    json[:user] = user.as_json
    json
  end
end
