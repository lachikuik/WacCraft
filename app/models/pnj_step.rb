class PnjStep < ApplicationRecord
   belongs_to :pnj, foreign_key: 'id_pnj'
   belongs_to :step, foreign_key: 'id_step'
 end
