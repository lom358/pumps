class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :title, :is_mobile, :stocks
  before_action :set_mobile, :set_categoroies

  def not_found
    render :json=>{status: 404}
  end

  private

  def set_categoroies
    @pumps_categories = PumpsCategory.select(:id, :title, :appointment).all.load
  end

  def set_mobile
    @is_mobile = mobile_browser?
  end

  def mobile_browser?
    flag = false
    str = request.env['HTTP_USER_AGENT'].to_s.downcase
    flag ||= str.include?('android')
    flag ||= str.include?('mobile')
    flag ||= str.include?('palm')
    flag ||= str.include?('iphone')
    flag ||= str.include?('ipad')
    flag ||= str.include?('blackberry')
    flag
  end



end
