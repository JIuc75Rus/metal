class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController,   ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "METAL22.RU"
    title       = [].join(" ")
    description = "Меркурий Бийск - торговая компания, предлагаем со склада в Бийске цветной металлопрокат любых марок, РТИ, АТИ, полимеры. Работаем под заказ."
    image       = options[:image] || "/assets/metal22.jpg"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
        site:        site_name,
        image:       image,
        description: description,
        twitter: {
            site_name: site_name,
            site: '@thecookieshq',
            card: 'summary',
            description: description,
            image: image
        },
        vk: {
            site_name: site_name,
            site: '@thecookieshq',
            card: 'summary',
            description: description,
            image: image
        },
        og: {
            url: current_url,
            site_name: site_name,
            title: title,
            image: image,
            description: description,
            type: 'website'
        }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  private

  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end
end
