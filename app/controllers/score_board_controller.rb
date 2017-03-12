class ScoreBoardController < ApplicationController
  TOKEN = "4c91feb4c123a608138e9bb7eb35f712b862e8a06fb0b3aa9fef4ba7cc5114b1"
  before_action :authenticate_user, only: [:score]

  def index
    refresh_counts
  end

  def score
    if yawn_params[:increment] == "true"
      Yawn.create(is_joe: yawn_params[:is_joe])
    end

    refresh_counts
    respond_to do |format|
      format.js
    end
  end

  def yawn_params
    params.require(:yawn).permit(:is_joe, :increment)
  end

  def refresh_counts
    @joe_yawns = Yawn.where(is_joe: true).count
    @karina_yawns = Yawn.where(is_joe: false).count
  end

  private

  def authenticate_user
    if yawn_params[:increment] == "true"
      authenticate_or_request_with_http_basic('Administration') do |_, password|
        auth = ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), TOKEN)
        unless auth
          flash[:error] = "Woah, who dis?"
          redirect_to root_path
          return
        end

        auth
      end
    end
  end
end
