class PlayingController < ApplicationController
  def verifyLoggedCharacter
    @character = Character.find_by(id: params[:id])
    if @character && @character.id_user == session[:user_id]
      session[:character_id] = @character.id
      redirect_to playing_enterWorld_path, notice: "Connected as : #{@character.name}"
    else
      redirect_to home_logged_path, alert: "Invalid character"
    end
  end

  def enterWorld
    @character = Character.find_by(id: session[:character_id])
    quest = Quest.find_by(id: 1)
    character_quest = CharacterQuest.find_by(id_character: @character.id, id_quest: quest.id)

    if character_quest.nil?
      @quest_available = true
      @pnj = nil
    else
      @pnj = Pnj.find_by(id: 2)
      @quest_available = false
    end
  end

  def take_quest
    @character = Character.find_by(id: session[:character_id])
    quest = Quest.find_by(id: 1)

    CharacterQuest.create(id_character: @character.id, id_quest: quest.id, advancement: 1)
    redirect_to playing_enterWorld_path, notice: "Quête prise avec succès !"
  end

  def talk
    @pnj = Pnj.find(params[:id])
    @character = Character.find_by(id: session[:character_id])

    # récup du résumé de la quête
    pnj_step = PnjStep.find_by(id_pnj: @pnj.id)
    step = Step.find_by(id: pnj_step.id_step)
    quest = Quest.find_by(id: step.id_quest)
    @conversation = quest.resume
  end

  def finish_quest
    @character = Character.find_by(id: session[:character_id])
    @pnj = Pnj.find(params[:id])

    # Trouver la quête associée au PNJ
    pnj_step = PnjStep.find_by(id_pnj: @pnj.id)
    step = Step.find_by(id: pnj_step.id_step)
    quest = Quest.find_by(id: step.id_quest)

    # Terminer la quête
    character_quest = CharacterQuest.find_by(id_character: @character.id, id_quest: quest.id)
    if character_quest
      character_quest.destroy
      redirect_to playing_enterWorld_path, notice: "Quête terminée avec succès !"
    else
      redirect_to playing_enterWorld_path, alert: "Quête non trouvée pour ce personnage."
    end
  end

  def attack_pnj
    @character = Character.find_by(id: session[:character_id])
    @pnj = Pnj.find(params[:id])
    render :attack_pnj
  end

  def perform_attack
    @character = Character.find_by(id: session[:character_id])
    @pnj = Pnj.find(params[:id])

    # combat simplifié (calcul avec hp et str)
    character_attack_power = @character.hp + @character.str
    pnj_attack_power = @pnj.hp + @pnj.str

    if character_attack_power > pnj_attack_power
      @result = "Vous avez gagné le combat contre #{@pnj.name}!"

      # Finir la quête en cas de victoire ( mais j'ai donné la possibilité de toujours pouvoir la reprendre x) )
      pnj_step = PnjStep.find_by(id_pnj: @pnj.id)
      step = Step.find_by(id: pnj_step.id_step)
      quest = Quest.find_by(id: step.id_quest)
      character_quest = CharacterQuest.find_by(id_character: @character.id, id_quest: quest.id)

      if character_quest
        character_quest.destroy
        flash[:notice] = "Vous avez terminé la quête avec succès en battant #{@pnj.name}!"
      end
    elsif pnj_attack_power > character_attack_power
      @result = "#{@pnj.name} a gagné le combat contre vous!"
    else
      @result = "Le combat s'est terminé par un match nul!"
    end

    render :attack_pnj
  end

end
