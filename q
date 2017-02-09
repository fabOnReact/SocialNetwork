
[1mFrom:[0m /home/fabrizio/Documents/Sublime/Rails/SocialNetwork/app/controllers/registrations_controller.rb @ line 17 RegistrationsController#update:

    [1;34m14[0m: [32mdef[0m [1;34mupdate[0m
    [1;34m15[0m: 	binding.pry
    [1;34m16[0m:   [1;34m# For Rails 4[0m
 => [1;34m17[0m:   account_update_params = devise_parameter_sanitizer.sanitize([33m:account_update[0m)
    [1;34m18[0m:   [1;34m# For Rails 3[0m
    [1;34m19[0m:   [1;34m# account_update_params = params[:user][0m
    [1;34m20[0m: 
    [1;34m21[0m:   [1;34m# required for settings form to submit when password is left blank[0m
    [1;34m22[0m:   [32mif[0m account_update_params[[33m:password[0m].blank?
    [1;34m23[0m:     account_update_params.delete([31m[1;31m"[0m[31mpassword[1;31m"[0m[31m[0m)
    [1;34m24[0m:     account_update_params.delete([31m[1;31m"[0m[31mpassword_confirmation[1;31m"[0m[31m[0m)
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: 
    [1;34m27[0m:   @user = [1;34;4mUser[0m.find(current_user.id)
    [1;34m28[0m:   [32mif[0m @user.update_attributes(account_update_params)
    [1;34m29[0m:     set_flash_message [33m:notice[0m, [33m:updated[0m
    [1;34m30[0m:     [1;34m# Sign in the user bypassing validation in case their password changed[0m
    [1;34m31[0m:     sign_in @user, [33m:bypass[0m => [1;36mtrue[0m
    [1;34m32[0m:     redirect_to after_update_path_for(@user)
    [1;34m33[0m:   [32melse[0m
    [1;34m34[0m:     render [31m[1;31m"[0m[31medit[1;31m"[0m[31m[0m
    [1;34m35[0m:   [32mend[0m
    [1;34m36[0m: [32mend[0m

