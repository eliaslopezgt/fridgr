class InvitacionesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def create
    mailchimp = Mailchimp::API.new(ENV["MAILCHIMP-API-KEY"])
    resp = mailchimp.lists.subscribe(APP_CONFIG[:mailchimp][:list_id_for_claimed_emails],
                              { "email" => params['email'],
                                "double_optin" => false,
                                "update_existing" => false
                              })
    test = 1
  end
end
