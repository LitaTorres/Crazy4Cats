class Reaction < ApplicationRecord
  belongs_to :publication
  belongs_to :user

  validates :kind, acceptance: {
    accept: %w[like dislike boting neutral uninterested interested]
  }

  def self.kinds 
    %w[like dislike boting neutral uninterested interested]
  end 
end
