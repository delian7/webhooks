class WebhooksController < ApplicationController


  def send_users
    requestbin_url = "http://requestb.in/vtd2rsvt"
    @userlist = User.all.map do |user|
      { :id => user.id, :first_name => user.first_name, :last_name => user.last_name}
    end

    json = @userlist.to_json

    @result = HTTParty.post(requestbin_url, :body => json, :headers => { 'Content-Type' => 'application/json' })


    render json: @result.to_s
  end

end
