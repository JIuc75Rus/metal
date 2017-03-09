class CallBackMailer < ApplicationMailer

    default from: 'metal22',
            template_path: 'mailers/call_back'

    def call_back(call_back)
      @call_back = call_back

      mail to: 'jiuc75rus@gmail.com',
           subject: 'Запрос звонка c сайта Меркурий'
    end
end