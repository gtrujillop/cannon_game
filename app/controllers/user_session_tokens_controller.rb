class UserSessionTokensController < ApplicationController
  before_action :set_user_session_token, only: [:show, :update, :destroy]

  # GET /user_session_tokens
  # GET /user_session_tokens.json
  def index
    @user_session_tokens = UserSessionToken.all

    render json: @user_session_tokens
  end

  # GET /user_session_tokens/1
  # GET /user_session_tokens/1.json
  def show
    render json: @user_session_token
  end

  # POST /user_session_tokens
  # POST /user_session_tokens.json
  def create
    @user_session_token = UserSessionToken.new(user_session_token_params)

    if @user_session_token.save
      render json: @user_session_token, status: :created, location: @user_session_token
    else
      render json: @user_session_token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_session_tokens/1
  # PATCH/PUT /user_session_tokens/1.json
  def update
    @user_session_token = UserSessionToken.find(params[:id])

    if @user_session_token.update(user_session_token_params)
      head :no_content
    else
      render json: @user_session_token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_session_tokens/1
  # DELETE /user_session_tokens/1.json
  def destroy
    @user_session_token.destroy

    head :no_content
  end

  private

    def set_user_session_token
      @user_session_token = UserSessionToken.find(params[:id])
    end

    def user_session_token_params
      params.require(:user_session_token).permit(:name, :user_session_id)
    end
end
