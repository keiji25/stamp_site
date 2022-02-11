class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:info,:prizelist, :mmmf_terms, :support, :tyusen, :contact]
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :access_log
    
    unless Rails.env.development?
      rescue_from Exception, with: :render_500
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
      rescue_from ActionController::RoutingError, with: :render_404
    end
   
    def routing_error
      raise ActionController::RoutingError, params[:path]
    end
   
    def render_404
      render 'errors/404', status: :not_found
    end
    
    def render_500
      render 'errors/500', status: :internal_server_error
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:student_no])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:student_no])
    end

    def access_control(role)
      if current_user.role_flag == "1"
        render 'errors/404', status: :not_found
      elsif User.find(current_user.id).role_flag.to_i < role
        flash[:alert] = "権限不足です"
        redirect_to setting_path and return 
      end
    end

    def release_befor
      if User.find(current_user.id).role_flag.to_i == 1 and Time.now <= Time.local(2021, 12, 20, 0, 0, 0, 0)
        redirect_to "/info" and return
      end
    end

    def access_log
      begin
        @student_no = current_user.student_no
      rescue
        @student_no = "未ログイン"
      ensure
        SiteInfo.create(student_no: @student_no, ip_add: request.remote_ip, path: request.fullpath)
      end
    end
end
