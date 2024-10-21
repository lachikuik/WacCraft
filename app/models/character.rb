class Character < ApplicationRecord
  belongs_to :user, foreign_key: 'id_user'
  belongs_to :classes, foreign_key: 'id_class'
  has_many :character_quests, foreign_key: 'id_character'
  has_many :quests, through: :character_quests

  def className
    classes.name
  end
end
