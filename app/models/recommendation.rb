class Recommendation < ActiveRecord::Base
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :contributor, class_name: "User", foreign_key: "contributor_id"

  validates :recipient, presence: true
  validates :contributor, presence: true
  validates :summary, presence: true
  validates :content, presence: true
end
