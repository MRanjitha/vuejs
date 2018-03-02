Rails.application.routes.draw do
  get 'nav/index'

  get 'nav/add_row'

  get 'nav/calc_nav'
  post 'nav/calc_nav'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
