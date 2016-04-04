module Api::V1  
  class SessionsController < ApiController
    before_action :set_session, only: [:show, :update, :destroy]

    # GET /sessions
    # GET /sessions.json
    def index
      render json: Session.all, each_serializer: SessionSerializer, root: false
    end

    def by_package_and_user
      @sessions = Session.by_package_and_user(session_params[:package_id], session_params[:user_id])
      render json: @sessions, each_serializer: SessionSerializer, root: false
    end

    # GET /sessions/1
    # GET /sessions/1.json
    def show
      render json: @session
    end

    # POST /sessions
    # POST /sessions.json
    def create
      @session = Session.new(session_params)

      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /sessions/1
    # PATCH/PUT /sessions/1.json
    def update
      @session = Session.find(params[:id])

      if @session.update(session_params)
        render json: @session, root: false
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end

    # DELETE /sessions/1
    # DELETE /sessions/1.json
    def destroy
      @session.destroy

      head :no_content
    end

    private

      def set_session
        @session = Session.find(params[:id])
      end

      def session_params
        params.require(:session).permit(:name, :start_date, :end_date, :package_id, :subject_id, :has_started, :user_id)
      end
  end
end
