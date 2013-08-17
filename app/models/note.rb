class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  belongs_to :user

  default_scope order("created_at DESC")

  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }

  def to_param
	  "#{id}-#{title}".parameterize
  end
end
