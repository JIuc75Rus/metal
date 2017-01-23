class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def page_not_found
    respond_to do |format|
      format.html { render template: 'pages/404', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end
end
