class TaggingsController < ApplicationController
  def destroy
    @tagging = Tagging.find(params[:id])
    @tagging.destroy
    redirect_to :back
  end
end
