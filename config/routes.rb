Rails.application.routes.draw do
  # HOME ROUTES
  get 'home/getAllUsers'
  get 'auth/form' => 'auth#form'

  # REGISTER ROUTES
  get 'auth/register' => 'auth#register'
  post 'auth/create' => 'auth#createUser'

  # LOGIN ROUTES
  get 'auth/login' => 'auth#login'
  post 'auth/verifyLogin' => 'auth#verifyLogin'

  # LOGGED / LOG-OUT ROUTES
  get 'home/logged' => 'home#logged'
  post 'auth/logout' => 'auth#logout'

  # =========================================================
  get "up" => "rails/health#show", as: :rails_health_check
  # =========================================================

  get "/fichestats", to: 'fichestats#index'
  get "/perso"  => 'characters#index'

  get "/battle", to: 'battle#index'
  # Route permettant de séléctionner notre character
  post "/select_perso" => 'characters#select'

  #Route permettant de créer un character
  get "/create_character" => 'characters#create_character'
  
  #Route permettant de mettre à jour l'image du character à afficher
  post "create_character_src" => 'characters#insert_character'

  #Route permettant de supprimer un character
  post "/delete_character" => 'characters#delete_character'

  #Route permettant de rentrer dans le jeu avec un character séléctionné
  post "/playing/enterWorld" => 'playing#verifyLoggedCharacter'
  get "/playing/enterWorld" => 'playing#enterWorld'

  # Routes pour interagir avec le PNJ
  get "/playing/talk/:id", to: 'playing#talk', as: 'talk_pnj'
  get "/playing/attack/:id", to: 'playing#attack_pnj', as: 'attack_pnj'
  post "/playing/perform_attack/:id", to: 'playing#perform_attack', as: 'perform_attack_pnj'
  post "/playing/finish_quest/:id", to: 'playing#finish_quest', as: 'finish_quest_pnj' # Changer en POST
  post "/playing/take_quest", to: 'playing#take_quest', as: 'take_quest'

  # ROOT ROUTE ('/', HOME PAGE)
  root "home#index"
end
