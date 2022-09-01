class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
  messages = Message.all
  messages.to_json
  end

  post '/messages' do
    post_message = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    post_message.to_json
  end

  patch '/messages/:id' do
    patch_message = Message.find(params[:id])
    patch_message.update(
      body: params[:body]
    )
    patch_message.to_json
  end

  delete '/messages/:id' do
    delete_message = Message.find(params[:id])
    delete_message.destroy
    delete_message.to_json
  end
end
