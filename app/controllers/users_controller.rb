class UsersController < ApplicationController
  require 'rest-client'
  # get 'accuweather'
  before_action :set_user, only: %i[ show update destroy ]


  def temp 
    
    @x= Accuweather.get_conditions(location_id: 'cityId:198186').current
    
    render json: @x
  end 
  # GET /users
  def index
    # url = "http://127.0.0.1:3000/users/1/posts"
    # response=RestClient.get(url)
    # render json: response
    # # (1..10).each do |t|
    # #   render text: response
    # # end 

    if params[:search].blank?
      @users = User.all
    end 
    @user=User.where(search: "#{params[:search]}")
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
