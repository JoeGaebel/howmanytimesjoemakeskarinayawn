class ScoreBoardController < ApplicationController
  def index
    refresh_counts
  end

  def score
    Yawn.create(is_joe: yawn_params[:is_joe]) if yawn_params[:increment]

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
end
