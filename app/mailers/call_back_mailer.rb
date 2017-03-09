class CallBackMailer < ApplicationMailer

    default from: '"Сообщение" - metal22.ru',
            template_path: 'mailers/call_back'

    def call_back(call_back)
      @call_back = call_back

      mail to: 'jiuc75rus@gmail.com',
           subject: 'Запрос звонка c сайта Меркурий'
    end
end