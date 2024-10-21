class Step < ApplicationRecord
    belongs_to :quests, foreign_key: 'id_quest'
    has_many :enigmes
    has_many :pnj_steps
    has_many :pnjs, through: :pnj_steps
end
