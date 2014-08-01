class Post < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { maximum: 1_000 }

  scope :pagination, ->(page, limit) { paginate(page: page, per_page: limit || 10) }
end
