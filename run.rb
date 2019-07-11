require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"
require_relative "app/lib/new_user.rb"

greeting
y_n = prompt 
if y_n == 'y' 
    existing_user_protocol
    # user_obj = username_checker
    # user_menu_opt = display_menu 
    # runner(user_menu_opt, user_obj) 
else
    answer = create? 
    new_user_protocol(answer)
end 

# def existing_user_protocol
#     user_obj = username_checker
#     user_menu_opt = display_menu 
#     runner(user_menu_opt, user_obj)
# end 

