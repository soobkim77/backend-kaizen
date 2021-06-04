class Board < ApplicationRecord
  belongs_to :owner, :polymorphic => true
  has_many :tasks, dependent: :destroy


end
