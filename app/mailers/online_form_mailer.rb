class OnlineFormMailer < ApplicationMailer

    default from: 'metal22.ru',
            template_path: 'mailers/online_form'
    def online_form(online_form)
      @online_form = online_form
      mail to: 'jiuc75pyc@gmail.com',
           subject: 'Online - заявка '

    end
end