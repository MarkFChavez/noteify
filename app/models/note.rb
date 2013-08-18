class Note < ActiveRecord::Base
  attr_accessible :content, :title, :category, :user_id

  belongs_to :user

  scope :unplaced, where(category: nil)
  scope :priority, where(category: "priority")
  scope :important, where(category: "important")
  scope :anything, where(category: "anything")

  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }

  def to_param 
	"#{id}-#{title}".parameterize
  end
end
