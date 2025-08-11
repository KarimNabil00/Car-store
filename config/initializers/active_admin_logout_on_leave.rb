# # config/initializers/active_admin_logout_on_leave.rb
# ActiveAdmin::BaseController.class_eval do
#   before_action :logout_if_not_admin_area

#   private

#   def logout_if_not_admin_area
#     # If we already have an admin logged in, but they came from outside /admin
#     if current_admin_user && request.referer.present? && !request.referer.start_with?(root_url + 'admin')
#       sign_out(current_admin_user)
#       redirect_to new_admin_user_session_path
#     end 
#   end
# end