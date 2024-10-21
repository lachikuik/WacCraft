class Quest < ApplicationRecord
    has_many :character_quests, foreign_key: 'id_quest'
    has_many :characters, through: :character_quests
    has_many :steps
  end
