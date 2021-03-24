class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def all
    Rails.logger.info "---------------- request ------------------"
    Rails.logger.info params.inspect
    Rails.logger.info "---------------  end ---------------------"
    render plain: :ok
  end
end
