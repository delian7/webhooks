class User < ActiveRecord::Base
  after_create :send_user_to_request_bin

  def send_user_to_request_bin
    requestbin_url = "http://requestb.in/1mhjqt41"
    @result = HTTParty.post(requestbin_url, :body => self.to_json, :headers => { 'Content-Type' => 'application/json' })
    return @result.response
  end
end
