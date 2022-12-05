class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'New post was successfully created'

      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated'

      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be updated'
      # Отрисовывается форма создания, все параметры остаются
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = 'Post was successfully deleted'

      redirect_to posts_path
    else
      flash[:failure] = 'Post cannot be deleted'

      redirect_to article_path(@post)
    end
  end

  private

  def post_params
    # Требуем наличия ключа :post в params. Разрешаем использовать только некоторые ключи
    params.required(:post).permit(:title, :body, :summary, :published)
  end
end
