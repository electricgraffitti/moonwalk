# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    helper :all
    helper_method :current_investor_session, :current_investor, :current_admin, :current_admin_session, :super?, :super_admin
    filter_parameter_logging :password, :password_confirmation

    private
      def current_investor_session
        return @current_investor_session if defined?(@current_investor_session)
        @current_investor_session = InvestorSession.find
      end

      def current_investor
        return @current_investor if defined?(@current_investor)
        @current_investor = current_investor_session && current_investor_session.record
      end

      def require_investor
        unless current_investor
          store_location
          flash[:notice] = "You must be logged in to access this page"
          redirect_to new_investor_session_url
          return false
        end 
      end

      def require_no_investor
        if current_investor
          store_location
          flash[:notice] = "You must be logged out to access this page"
          redirect_to account_url
          return false
        end
      end
      
      def current_admin_session
        return @current_admin_session if defined?(@current_admin_session)
        @current_admin_session = AdminSession.find
      end

      def current_admin
        return @current_admin if defined?(@current_admin)
        @current_admin = current_admin_session && current_admin_session.record
      end

      def require_admin
        unless current_admin
          store_location
          flash[:notice] = "You must be logged in to access this page"
          redirect_to new_admin_session_url
          return false
        end
      end

      def require_no_admin
        if current_admin
          store_location
          flash[:notice] = "You must be logged out to access this page"
          redirect_to account_url
          return false
        end
      end

      def store_location
        session[:return_to] = request.request_uri
      end

      def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
      end
      
      
      protected

      def super_admin
       unless super? 
         return false
       end
      end

      def super?
        authenticate_or_request_with_http_basic do |username, password|
          username == APP['username'] && password == APP['password']
        end
      end
end
