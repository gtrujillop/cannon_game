module Api::V1
  class UserSessionsController < ApiController
    before_action :set_user_session, only: [:show, :update, :destroy]

    # GET /user_sessions
    # GET /user_sessions.json
    def index
      @user_sessions = UserSession.all

      render json: @user_sessions, root: false
    end

    # GET /user_sessions/1
    # GET /user_sessions/1.json
    def show
      render json: @user_session
    end

    # POST /user_sessions
    # POST /user_sessions.json
    def create
      @user_session = UserSession.new(user_session_params)

      if @user_session.save
        render json: @user_session, status: :created, location: @user_session
      else
        render json: @user_session.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /user_sessions/1
    # PATCH/PUT /user_sessions/1.json
    def update
      @user_session = UserSession.find(params[:id])

      if @user_session.update(user_session_params)
        head :no_content
      else
        render json: @user_session.errors, status: :unprocessable_entity
      end
    end

    # DELETE /user_sessions/1
    # DELETE /user_sessions/1.json
    def destroy
      @user_session.destroy

      head :no_content
    end

    private

      def set_user_session
        @user_session = UserSession.find(params[:id])
      end

      def user_session_params
        params.require(:user_session).permit(:user_id, :session_id, :grade, :session_date)
      end
  end
end
