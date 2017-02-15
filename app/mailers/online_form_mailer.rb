class OnlineFormMailer < ApplicationMailer

    default from: 'metal22.ru',
            template_path: 'mailers/online_forms'
    def online_form(online_form)
      @online_form = online_form
      mail to: 'metal7@rambler.ru',
           subject: 'Online - заявка'

    end
end