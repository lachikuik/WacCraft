class PnjSpell < ApplicationRecord
    belongs_to :pnjs, foreign_key: 'id_pnj'
    belongs_to :spells, foreign_key: 'id_spell'
     
 end