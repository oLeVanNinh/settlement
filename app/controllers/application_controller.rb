class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def all
    Rails.logger.info "---------------- request ------------------"
    Rails.logger.info params.inspect
    Rails.logger.info "---------------  end ---------------------"
    if params[:res_tracking_id]
      receipts = Rails.cache.read(:receipts) || []
      receipts.push params.to_h
      Rails.cache.write(:receipts, receipts)
    end
    render plain: "OK", layout: false
  end

  def receipts
    @receipts = Rails.cache.read(:receipts) || []
    render "receipts/index"
  end
end
