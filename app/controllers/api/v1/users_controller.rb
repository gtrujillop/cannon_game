module Api::V1 
  class UsersController < ApiController
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    # GET /users.json
    def index
      @users = User.all

      render json: @users, each_serializer: UserSerializer, root: false
    end

    # GET /users/1
    # GET /users/1.json
    def show
      render json: @user
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params.except(:packages))
      if @user.save && @user.save_packages(user_params[:packages])
        render json: @user, serializer: UserSerializer, root: false,  status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user.destroy

      head :no_content
    end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :is_admin, :packages => [:package_id])
      end
  end
end
