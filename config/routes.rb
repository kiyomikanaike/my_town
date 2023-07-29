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
    get 'members/my_posts' => 'members#my_posts', as: 'my_posts' #会員の投稿一覧
    get 'members/favorite_posts' => 'members#favorite_posts', as: 'favorite_posts' #会員のお気に入り一覧
    get 'members/information/edit' => 'members#edit'#会員登録情報編集
    patch 'members/information' => 'members#update'#会員登録情報更新
    get 'members/confirm_withdraw' => 'members#confirm_withdraw'#会員退会確認画面
    patch 'members/withdraw' => 'members#withdraw'#会員退会処理
    get 'members/favorites' => 'members#favorites'#お気に入り登録
    get 'posts/search', to: 'posts#search', as: 'search_posts'#絞り込み表示
    resources :posts,only: [:new,:create,:index,:show,:edit,:update,:destroy] do#投稿機能
     resource :favorites, only: [:create, :destroy]
    end
     resource :favorites, only: [:create, :destroy]#お気に入り機能

  end

  #管理者側のルーティング設定
  get 'admin' => 'admin/homes#top'#管理者トップページ（会員一覧）
  namespace :admin do
    resources :members,only: [:show,:edit,:update]
    get 'posts/:id/history' => 'posts#history', as: 'posts_history'
    resources :posts, only: [:show, :destroy]
  end

  #ゲストログイン
  devise_scope :member do
    post 'members/guest_sign_in', to: 'members/sessions#guest_sign_in'
  end


 end
