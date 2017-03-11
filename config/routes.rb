Rails.application.routes.draw do
  get 'score_board/index'
  root 'score_board#index'

  post 'score_board/score'
end
