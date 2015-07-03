class InvitacionesController < ApplicationController

  def create
    result = EmailValidator.valid?(params['email'])? subscribe_email(params['email']) : false
    respond_to do |format|
      format.html { redirect_to welcome_index_path, :flash => { :notice => "Review invite was successfully created." } }
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
