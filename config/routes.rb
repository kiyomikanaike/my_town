Rails.application.routes.draw do
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #会員側のルーティング設定
  root to:'public/homes#top'#会員トップページ
  scope module: :public do
    get 'members/my_page' => 'members#show'#会員マイページ
    get 'members/information/edit' => 'members#edit'#会員登録情報編集
    patch 'members/information' => 'members#update'#会員登録情報更新
    get 'members/confirm_withdraw' => 'members#confirm_withdraw'#会員退会確認画面
    patch 'members/withdraw' => 'members#withdraw'#会員退会処理
  
    resources :posts,only: [:new,:create,:index,:show,:edit,:update,:destroy]#投稿機能
  end

  #管理者側のルーティング設定
  get 'admin' => 'admin/homes#top'#管理者トップページ
  namespace :admin do
    resources :members,only: [:index,:show,:edit,:update,:destroy]

  end


 end
