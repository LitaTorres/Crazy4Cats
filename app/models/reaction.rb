class Reaction < ApplicationRecord
  belongs_to :publication
  belongs_to :user

  validates :kind, acceptance: {
    accept: %w[Me_gusta No_me_gusta Divertido Neutral Hermoso Interesante]
  }

  def self.kinds 
    %w[Me_gusta No_me_gusta Divertido Neutral Hermoso Interesante]
  end 
end
