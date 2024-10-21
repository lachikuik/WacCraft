class BattleController < ApplicationController
  def index
    
    
    # Bagarre!!!!!
  # end

    # Affichage du personnage actuel
    @Character = Character.find(2)
    @Characterhp = @Character.hp + @Character.str*50
    @CharacterMana = @Character.intel*50
    @CharacterAttack = 10 + @Character.str*5
    @CharacterArmor = @Character.agi*5

    # Affichage de la classe du personnage
    @CharacterClass = Classes.find(@Character.id_class)
    @CharacterClassname= @CharacterClass.name

    # Affichage des sorts du personnage
    @IdSpells = ClassesSpells.where(:id_class => @CharacterClass.id)
    @CharacterSpells = Spells.where(:id => @IdSpells.map { |x| x.id_spell })

    # Affichage de l'adversaire
    @IdQuest = CharacterQuest.where(:id_character => @Character.id)
    puts YAML::dump(@IdQuest)
    @Quest = Quest.where(:id => @IdQuest.map { |x| x.id_quest})
    @Step = Step.where(:id_quest => @Quest.map { |x| x.id }, :number => @IdQuest.map{ |x| x.advancement})
    @IdPnj = PnjStep.where(:id_step => @Step.map { |x| x.id })
    @Pnj = Pnj.find(@IdPnj.map { |x| x.id_pnj })
    @Pnj = @Pnj.first()

    # puts YAML::dump(@Pnj)

    @PnjHp = @Pnj.hp + @Pnj.str*50
    @PnjMana = @Pnj.intel*50
    @PnjAttack = 10 + @Pnj.str*5
    @PnjArmor = @Pnj.agi*5


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personnage }
    end
  end

  # def attack
  #   @PnjHp = @PnjHp - @CharacterAttack
  # end 
end