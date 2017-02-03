class OrderNotifierMailer < ApplicationMailer

  def received(order)
    @order = order
  mail to: 'jiuc75pyc@gmail.com', subject: 'Подтверждение заказа в Pragmatic Store'
  end

  def shipped(order)
    @order = order
  mail to: order.email, subject: 'Заказ из Pragmatic Store отправлен'
  end
end
