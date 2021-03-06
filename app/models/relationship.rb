class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  validates :following_id, presence: true
  belongs_to :follower, class_name: "User"
  validates :follower_id, presence: true
  has_one :activity, as: :action, dependent: :destroy
  after_create :relationship_activity

  def relationship_activity
    create_activity(user: follower)
  end
end
