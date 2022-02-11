class AdminimanagesController < ApplicationController
  before_action -> {access_control(3)}
  def in
  end
  def out
  end
  def success
    user = Adminimanage.find_by(user_id: params[:user_id])
    staff = Staff.find_by(staff_id: params[:user_id])
    if staff.nil?
      if user.nil?
        flash[:alert] = "無効なチケットです"
        redirect_to adminimanages_error_path
      elsif user.in.nil?
        user.update(in: Time.now.to_s(:db))
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_in_path
        end
      elsif user.out.present?
        flash[:alert] = "すでに使用済のチケットです"
        redirect_to adminimanages_error_path
      else  
        user.update(out: Time.now.to_s(:db))
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_out_path
        end
      end
    else
      if user.nil?
        Adminimanage.create({user_id: params[:user_id],role: "2"})
        user = Adminimanage.find_by(user_id: params[:user_id])
        user.update(in: Time.now.to_s(:db))
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_in_path
        end
      elsif user.in.nil?
        user.update(in: Time.now.to_s(:db))
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_in_path
        end
      elsif user.out.present?
        user.update(in: Time.now.to_s(:db))
        user.update(out: "")
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_in_path
        end
      else  
        user.update(out: Time.now.to_s(:db))
        if request.referer == adminimanages_auto_url
          redirect_to adminimanages_success_out_path
        end
      end
    end
  end
  def error
  end
  def form
    @adminimanage = Adminimanage.new
  end
  def create
    adminimanage_params[:user_id].to_i.times {
      Adminimanage.create({user_id: SecureRandom.alphanumeric(10),role: "1"})
    }
    redirect_to "/adminimanages/form", notice: adminimanage_params[:user_id].to_s + "個作成しました！" and return
  end
  def adminimanage_params
    params.permit(:user_id)
  end

  def auto
    @time = Time.now
  end

  def index
    @adminimanages = Adminimanage.all
    @adminicnt = Adminimanage.count
    @adminiused = Adminimanage.where.not(in: nil?).count
    @adminiunused = @adminicnt - @adminiused
  end
  def ticket_qr
    @adminimanages = Adminimanage.where(role: "1").where(in: nil)
  end
end
