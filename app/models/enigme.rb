class Enigme < ApplicationRecord
    belongs_to :steps, foreign_key: 'id_step'
    has_many :answers
    
end