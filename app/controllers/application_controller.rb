class ApplicationController < ActionController::Base
  def all
    Rails.logger.info "---------------- request ------------------"
    Rails.logger.info params.inspect
    Rails.logger.info "---------------  end ---------------------"
    render plain: :ok
  end
end
