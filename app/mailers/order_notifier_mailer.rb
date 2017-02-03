class OrderNotifierMailer < ApplicationMailer

  def received(order)
    @order = order
    mail to: 'jiuc75pyc@gmail.com', subject: 'Заказ с сайта'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Подтверждение заказа в ООО"Меркурий"'
  end
end
