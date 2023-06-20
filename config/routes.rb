Rails.application.routes.draw do
  devise_for :posts
  devise_for :members
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #会員側のルーティング設定
  root to:'public/homes#top'#会員側トップページ

  #管理者側のルーティング設定

end
