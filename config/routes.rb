Ide::Application.routes.draw do
  resources :philes

  match 'jqueryfiletree', to: 'jqueryfiletree#content'
  root :to => 'main#index'
  # match ':controller(/:action(/:id))(.:format)'
end
