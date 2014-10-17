get '/users/forgot' do 
  @user = User.new
  erb :"users/forgot"
end

post '/users/forgot' do 
  email = params[:email]
  user = User.first(email: params[:email] )
  if user
    token = create_new_token
    user.update(password_token: token,
          password_token_timestamp: create_new_timestamp)
    send_email(user, token)
    "Password reset link sent to your email address"
    redirect to '/'
  else
    flash[:errors] = ["Sorry, #{email} is not registered. Please sign up first!"]
    redirect to '/users/forgot'
  end 
end

def create_new_token
  (1..64).map{('A'..'Z').to_a.sample}.join
end

def create_new_timestamp
  Time.now 
end

get '/users/reset/:password_token' do 
  user = User.first(password_token: params[:password_token])
  if user
    erb :"users/update_password"
  else
    "Your token is rejected!"
  end
end

post '/users/reset_password' do 
  user = User.first(password_token: params[:password_token])
  if user
    user.update(password: params[:password], 
                password_confirmation: params[:password_confirmation])
    "Password updated successfully"
  end
end

def send_email
  RestClient.post "https://api:key-dd499fed82249487919e1af19f7fd66f"\
  "@api.mailgun.net/v2/sandbox43830a12e14e48f0823d1f1f846435cc.mailgun.org/messages",
  :from => "Excited User <me@samples.mailgun.org>",
  :to => "nikeshashar@gmail.com",
  :subject => "Hello",
  :text => "Testing some Mailgun awesomness!"
end

