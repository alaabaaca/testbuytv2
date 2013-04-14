# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Bạn không có quyền truy cập vào chức năng này!'
    redirect_to  root_url
  end
end
