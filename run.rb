require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"
require_relative "app/lib/new_user.rb"

greeting

y_n = prompt #########

if y_n == 'y' ########

    user_obj = username_checker

    user_menu_opt = display_menu 

    runner(user_menu_opt, user_obj) 
else
    answer = create?
    new_user_protocol(answer)
    # method that asks for the person's name(which must be a string)
    # username which must be a string less than 10 characters long
    # amount to fund the account with (must be an integer that cannot exceed 20,000)
end 

