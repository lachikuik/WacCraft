class Spells < ApplicationRecord
    has_many :classes_spells
    has_many :pnjs_spells

end
