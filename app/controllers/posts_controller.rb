class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
 
  # GET /posts
  def index 
     

     @user=User.find(params[:user_id])
     render json:  @user.posts.all
     

    #  render json: @posts
  end
  

  # GET /posts/1
  def show
    
    @user=User.find(params[:user_id])
   @user.posts.find(params[:id])
    
    

  end

  # POST /posts
  def create
    @user=User.find(params[:user_id])

    @post = @user.posts.new(post_params)
    

    if @post.save
      render json: @post, status: :created

    else
      render json: @post.errors
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:caption, :media, :user_id)
    end
end
