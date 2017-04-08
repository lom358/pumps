class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :title, :is_mobile, :stocks
  before_action :set_mobile

  def send_form
    begin
      res = (ApplicationMailer.send_to_email(params).deliver != nil) ? 'success' : 'error'
      render :json => {'status': res}
    rescue
      render :json =>  {'status': 'error'}
    end
  end

  def not_found
    render :json=>{status: 404}
  end

  def get_stocks
    @stocks = Stock.where(:show => true).load
  end

  private

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
