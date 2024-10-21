class Inventory < ApplicationRecord
   belongs_to :characters, foreign_key: 'id_character'    
end