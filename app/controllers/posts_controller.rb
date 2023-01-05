class PostsController < ApplicationController
  def index
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @post).deliver_now
      end 
      redirect_to  posts_path, notice: 'post was successfully'
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :status)
    end
end
