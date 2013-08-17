class Note < ActiveRecord::Base
  attr_accessible :content, :title, :category, :user_id

  belongs_to :user

  default_scope order("created_at DESC")
  scope :unplaced, where(category: nil)

  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }

  def to_param 
	"#{id}-#{title}".parameterize
  end
end
