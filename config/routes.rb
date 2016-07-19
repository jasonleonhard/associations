# routes.rb
Rails.application.routes.draw do

# Polymorphic associations
  resources :people do 
    resources :interactions, only: [:new, :create, :edit, :update]
  end
  resources :businesses do
    resources :interactions, only: [:new, :create, :edit, :update]
  end
  # get 'interactions/new'
  # get 'interactions/create'
  # get 'interactions/edit'
  # get 'interactions/update'
  root to: "people#index"

# associations: has_many _____ and belongs_to :_____, dependent: :destroy
  resources :customers  # has_many accounts and orders
    resources :accounts # belongs_to customer
    resources :orders   # belongs_to customer
  # root 'customers#index'

# Nested resources
  resources :users      # non-nested
  resources :posts do   # parent
    resources :comments # child
  end

  # access nested resources this way:
    # def create
    #   @post = Post.find(params[:post_id]) 
    #   @comment = @post.comments.create(comment_params)  # notice     @post.comments.create(comment_params)
    #   @comment.user_id = current_user.id #or whatever is you session name
    #   if @comment.save
    #     redirect_to @post
    #   else
    #     flash.now[:danger] = "error"
    #   end
    # end
end
