class ClassesSpells < ApplicationRecord
    has_many :classes
    has_many :spells
end