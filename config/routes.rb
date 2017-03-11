Rails.application.routes.draw do
  get 'score_board/index'
  root 'score_board#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
