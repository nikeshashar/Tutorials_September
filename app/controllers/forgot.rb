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