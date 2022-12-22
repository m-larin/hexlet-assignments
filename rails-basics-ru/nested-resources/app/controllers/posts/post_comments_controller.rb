# frozen_string_literal: true

class Posts::PostCommentsController < Posts::ApplicationController
  before_action :set_post, only: [:new, :create, :index, :destroy]

  def index
    @comments = @post.post_comments.all
  end

  def show
    @omment = PostComment.find params[:id]
  end

  def new
    @comment = @post.post_comments.build
  end

  def edit
    @comment = PostComment.find params[:id]
  end

  def create
    @comment = @post.post_comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @comment = PostComment.find params[:id]

    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = PostComment.find params[:id]

    @comment.destroy

    redirect_to post_path(@post), notice: 'Comment was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
