class CharacterQuest < ApplicationRecord
  belongs_to :character, foreign_key: 'id_character'
  belongs_to :quest, foreign_key: 'id_quest'
end
