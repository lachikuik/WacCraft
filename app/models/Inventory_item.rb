class InventoryItem < ApplicationRecord

    # has_and_belongs_to_many :spells

   belongs_to :inventories, foreign_key: 'id_inventory'
   belongs_to :items, foreign_key: 'id_item'
    
end