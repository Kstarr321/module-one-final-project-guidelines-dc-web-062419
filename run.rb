require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"
require_relative "app/lib/new_user.rb"

greeting
y_n = prompt 
if y_n == 'y' 
    existing_user_protocol
else
    answer = create? 
    new_user_protocol(answer)
end 
            