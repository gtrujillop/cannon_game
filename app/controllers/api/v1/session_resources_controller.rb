module Api::V1
  class SessionResourcesController < ApiController
    before_action :set_session_resource, only: [:show, :update, :destroy]

    # GET /session_resources
    # GET /session_resources.json
    def index
      @session_resources = SessionResource.all

      render json: @session_resources
    end

    # GET /session_resources/1
    # GET /session_resources/1.json
    def show
      render json: @session_resource
    end

    # POST /session_resources
    # POST /session_resources.json
    def create
      @session_resource = SessionResource.new(session_resource_params)

      if @session_resource.save
        render json: @session_resource, status: :created, location: @session_resource
      else
        render json: @session_resource.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /session_resources/1
    # PATCH/PUT /session_resources/1.json
    def update
      @session_resource = SessionResource.find(params[:id])

      if @session_resource.update(session_resource_params)
        head :no_content
      else
        render json: @session_resource.errors, status: :unprocessable_entity
      end
    end

    # DELETE /session_resources/1
    # DELETE /session_resources/1.json
    def destroy
      @session_resource.destroy

      head :no_content
    end

    private

      def set_session_resource
        @session_resource = SessionResource.find(params[:id])
      end

      def session_resource_params
        params.require(:session_resource).permit(:name, :url, :session_id)
      end
  end
end
