class Classes < ApplicationRecord

    # has_and_belongs_to_many :spells

    has_many :classes_spells
    has_many :spells, :through => :classes_spells
    
end
