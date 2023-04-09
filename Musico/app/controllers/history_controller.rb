class HistoryController < ApplicationController
  def index
    @history = current_user.history
  end

  def create
  end

  def destroy

  end
end
