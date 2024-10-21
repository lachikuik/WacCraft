class CharactersController < ApplicationController
    #Route qui vas lister tous les personnages de WacCraft
    def index
        if session[:user_id]
            @characters =  User.find_by(id: session[:user_id]).characters
        end
    end

    #Route qui permet de créer un character
    def create_character
        @characters = Character.all
        @character = []
        @classes = Classes.all
        # @avatar = flash[:avatar]
    end

    #Route qui permet de supprimer un character
    def delete_character
    end

    #Route permettant d'inserer un nouveaux character
    def update_image
        # @character = Character.where(id: params[:character_race])
        
        # flash[:avatar] = [@character[0].jpg, @character[0].lvl]
        # redirect_to create_character_path, notice:  "Personnage mis à jour avec succès #{@character[0].name}"  
    end
    skip_before_action :verify_authenticity_token

    def insert_character

        character = Character.new
        character.id_user = session[:user_id]
        character.id_class = params[:classes]
        character.name = params[:name_character]
        character.hp = 100
        character.str = 100
        character.intel = 100
        character.agi = 100
        character.lvl = 100
        character.xp = 100
        character.gold = 100
        character.jpg =  params[:avatar_character]

        character.save
        redirect_to create_character_path, notice:  "Character créer avec success" 
    end

end
