def set_authenticated_user(user = nil)
  user ||= Fabricate(:user)  
  session[:user_id] = user.id 
end 

def clear_authenticated_user
  session[:user_id] = nil
end 

def authenticated_user
  User.find(session[:user_id])
end 

def sign_in(user=nil)
  user || Fabricate(:user)
  visit sign_in_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
end   