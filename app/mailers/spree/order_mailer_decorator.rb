Spree::OrderMailer.class_eval do
  # There might be a cleaner way to set locale instead of rewriting each method
  def confirm_email(order_id, resend=false)
    order = Spree::Order.find(order_id)
    @order = order
    I18n.locale = order.locale
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"
    mail(:to => order.email,
    :subject => subject)
  end

  def cancel_email(order_id, resend=false)
    order = Spree::Order.find(order_id)
    @order = order
    I18n.locale = order.locale
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.cancel_email.subject')} ##{order.number}"
    mail(:to => order.email,
    :subject => subject)
  end
end