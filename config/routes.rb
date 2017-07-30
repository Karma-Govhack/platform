Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'
    resources :volunteers, :login, :skills, :job, :charityapi, :sector
    match '*any' => 'application#options', :via => [:options]
end
