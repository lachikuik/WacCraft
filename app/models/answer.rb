class Answer < ApplicationRecord
    belongs_to :enigmes, foreign_key: 'id_enigme'
    
end