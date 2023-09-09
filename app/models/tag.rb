class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :question_tags
  has_many :questions, through: :question_tags

  def self.filter(name)
    where('name iLIKE ?', "%#{name}%")
  end
end
