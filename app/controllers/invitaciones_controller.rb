class InvitacionesController < ApplicationController
  # skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    result = EmailValidator.valid?(params['email'])? subscribe_email(params['email']) : false
    mensaje = result ? "Su invitacion sera procesada a la brevedad, gracias!" : "Hubo un error en su solicitud, intente mas tarde."
    respond_to do |format|
      format.html { redirect_to root_path, :flash => { :notice => mensaje } }
    end
  end

  def subscribe_email(email)
    begin
      mailchimp = Mailchimp::API.new(ENV["MAILCHIMP-API-KEY"])
      resp = mailchimp.lists.subscribe(APP_CONFIG[:mailchimp][:list_id_for_claimed_emails],
                                       { email: email},
                                     {},
                                     'html',
                                     false)
    rescue
      resp = {}
      resp[:euid] = ''
    end
    return !resp['euid'].to_s.empty?
  end
end
