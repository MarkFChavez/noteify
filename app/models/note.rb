class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  belongs_to :user

  default_scope order("created_at DESC")
end
