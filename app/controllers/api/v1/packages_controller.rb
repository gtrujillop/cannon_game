module Api::V1
  class PackagesController < ApiController
    before_action :set_package, only: [:show, :update, :destroy]
    # TODO Implement this on each request
    # before_action :authenticate_request!

    # GET /packages
    # GET /packages.json
    def index
      @packages = Package.all

      render json: @packages, each_serializer: PackageSerializer, root: false
    end

    def by_user
      @packages = []
      @user_packages = UserPackage.by_user(params[:id])
      @user_packages.each do |user_package|
        @packages << user_package.package
      end
      render json: @packages, each_serializer: PackageSerializer, root: false
    end

    # GET /packages/1
    # GET /packages/1.json
    def show
      render json: @package
    end

    # POST /packages
    # POST /packages.json
    def create
      @package = Package.new(package_params)

      if @package.save
        render json: @package, status: :created
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /packages/1
    # PATCH/PUT /packages/1.json
    def update
      @package = Package.find(params[:id])

      if @package.update(package_params)
        head :no_content
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end

    # DELETE /packages/1
    # DELETE /packages/1.json
    def destroy
      @package.destroy

      head :no_content
    end

    private

      def set_package
        @package = Package.find(params[:id])
      end

      def package_params
        params.require(:package).permit(:name, :session_count)
      end
  end
end
