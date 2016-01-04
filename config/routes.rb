Rails.application.routes.draw do
  get "/send_users" => "webhooks#send_users"
end
