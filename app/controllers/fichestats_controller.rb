class FichestatsController < ApplicationController
  def index
    
    
    # LESSTAAATTS
  # end

    # Affichage du personnage actuel
    @Character = Character.find(1)
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

    # Affichage de l'inventaire du personnage
    @CharacterInventory = Inventory.find(@Character.id)
    @IdItems = InventoryItem.where(:id_inventory => @CharacterInventory.id)
    @CharacterItems = Item.where(:id => @IdItems.map { |x| x.id_item })

    #Affichage de l'équipement du personnage
    @CharacterStuff = Stuff.where(:id_inventory => @CharacterInventory.id)
    # puts YAML::dump(@CharacterStuff)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personnage }
    end
  end
end