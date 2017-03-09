class CallBackMailer < ApplicationMailer

  default from: 'metal22@metal22.ru',
          template_path: 'mailers/call_back'

  def call_back(call_back)
    @call_back = call_back

    mail to: 'metal7@rambler.ru',
         subject: 'Запрос звонка c сайта Меркурий'
  end
end