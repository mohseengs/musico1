class GroupSessionsController < ApplicationController
  before_action :set_group_session, only: %i[ show edit update destroy ]

  # GET /group_sessions or /group_sessions.json
  def index
    @group_sessions = GroupSession.all
  end

  # GET /group_sessions/1 or /group_sessions/1.json
  def show
  end

  # GET /group_sessions/new
  def new
    @group_session = GroupSession.new
  end

  # GET /group_sessions/1/edit
  def edit
  end

  # POST /group_sessions or /group_sessions.json
  def create
    @group_session = GroupSession.new(group_session_params)
    @group_session.group_admin = current_user
    if @group_session.save
      redirect_to group_session_url(@group_session), notice: "Group session was successfully created."

    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /group_sessions/1 or /group_sessions/1.json
  def update
    if @group_session.update(group_session_params)
        redirect_to group_session_url(@group_session), notice: "Group session was successfully updated."
    else
        render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /group_sessions/1 or /group_sessions/1.json
  def destroy
    @group_session.destroy
    redirect_to group_sessions_url, notice: "Group session was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_session
      @group_session = GroupSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_session_params
      params.require(:group_session).permit(:name)
    end
end
