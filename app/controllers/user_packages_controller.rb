class UserPackagesController < ApplicationController
  before_action :set_user_package, only: [:show, :update, :destroy]

  # GET /user_packages
  # GET /user_packages.json
  def index
    @user_packages = UserPackage.all

    render json: @user_packages
  end

  # GET /user_packages/1
  # GET /user_packages/1.json
  def show
    render json: @user_package
  end

  # POST /user_packages
  # POST /user_packages.json
  def create
    @user_package = UserPackage.new(user_package_params)

    if @user_package.save
      render json: @user_package, status: :created, location: @user_package
    else
      render json: @user_package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_packages/1
  # PATCH/PUT /user_packages/1.json
  def update
    @user_package = UserPackage.find(params[:id])

    if @user_package.update(user_package_params)
      head :no_content
    else
      render json: @user_package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_packages/1
  # DELETE /user_packages/1.json
  def destroy
    @user_package.destroy

    head :no_content
  end

  private

    def set_user_package
      @user_package = UserPackage.find(params[:id])
    end

    def user_package_params
      params.require(:user_package).permit(:user_id, :package_id)
    end
end
