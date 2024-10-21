class Stuff < ApplicationRecord
    belongs_to :inventories, foreign_key: 'id_inventory'    
 end