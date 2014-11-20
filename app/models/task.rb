class Task < ActiveRecord::Base
  validates :body, presence: true
  validates :title, presence: true

  belongs_to :user

  default_scope { order(created_at: :desc) }

  def self.not_completed
    where(completed: false)
  end
end
