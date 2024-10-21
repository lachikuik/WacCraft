class Pnj < ApplicationRecord
    has_many :pnj_steps
    has_many :steps, through: :pnj_steps
    has_many :pnj_spells
  end
