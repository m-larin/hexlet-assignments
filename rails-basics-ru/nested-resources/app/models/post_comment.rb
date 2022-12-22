class PostComment < ApplicationRecord
  # BEGIN
  belongs_to :post

  validates :comment, presence: true
  # END
end