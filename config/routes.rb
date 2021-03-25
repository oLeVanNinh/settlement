Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#all"
  get "receipts", to: "application#receipt"
  match "*path", to: "application#all", via: :all
end
