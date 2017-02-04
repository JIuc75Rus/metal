class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound do |exception|
    page_not_found 404
  end
  def page_not_found
    respond_to do |format|
      format.html { render template: 'pages/404', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html {render template: 'pages/404', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500 }
    end
  end
end
