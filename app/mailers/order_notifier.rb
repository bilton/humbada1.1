class OrderNotifier < ActionMailer::Base
  default from: "vbbtran@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
def received(order)
@order = order
mail to: order.email, subject: 'Humbada Chilli Store purchase confirmation', bcc: 'native_bilton@hotmail.com'
end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: "Humbada Chilli Now Shipped"
  end
end
