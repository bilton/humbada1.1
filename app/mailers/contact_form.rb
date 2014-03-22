class ContactForm < ActionMailer::Base
  default from: "vbbtran@gmail.com"

  def contacting(contact)
	@contact = contact
	mail to: "vbbtran@gmail.com", subject: 'Contact form message', bcc: 'native_bilton@hotmail.com'
  end

end
