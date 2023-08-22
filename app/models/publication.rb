class Publication < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy 
  has_many :users, through: :reactions
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :reactions, allow_destroy: true

  def count_with_kind(arg)
      number = self.reactions.where(kind: arg).count
      return "#{arg} - #{number}"
  end
  
  def find_kind_user_relation(user)
      self.reactions.find_by(user_id: user.id).kind
  end
end

#pese que a 1 publicación pertenece a 1 usuario
# muchos usuarios pueden reaccionar muchas veces (linea 4)