class Board < ApplicationRecord
  belongs_to :owner, :polymorphic => true
  has_many :tasks, dependent: :destroy


  def statuses
    self.tasks.map{|t| t.status}.uniq
  end
end
