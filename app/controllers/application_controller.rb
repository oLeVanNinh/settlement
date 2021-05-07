class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def all
    Rails.logger.info "---------------- request ------------------"
    Rails.logger.info params.inspect
    Rails.logger.info "---------------  end ---------------------"
    if params[:res_tracking_id]
      receipts = Rails.cache.read(:receipts) || []
      unless receipts.find { |r| r["res_tracking_id"] == params[:res_tracking_id] }
        receipts.push params.permit(:cust_code, :order_id, :res_tracking_id, :sps_hashcode).to_h
        Rails.cache.write(:receipts, receipts)
      end
    end
    sleep 10
    render plain: "OK", layout: false
  end

  def receipt
    @receipts = Rails.cache.read(:receipts) || []
    render "receipts/index"
  end
end
