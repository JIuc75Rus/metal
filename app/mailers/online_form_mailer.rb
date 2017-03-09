class OnlineFormMailer < ApplicationMailer

    default from: 'metal22',
            template_path: 'mailers/online_form'
    def online_form(online_form)
      @online_form = online_form
      mail to: 'jiuc75rus@gmail.com',
           subject: 'Сообщение с сайта Меркурий'

    end
end