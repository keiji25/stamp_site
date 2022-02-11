class GetController < ApplicationController
  before_action -> {access_control(5)}, except: [:stamp]
  def stamp
    @get_stamp = params[:id]
    @stamp = Stamp.find_by(stamp_id: @get_stamp)
    if @stamp.nil?
      render 'errors/404', status: :not_found and return
    elsif GetStamp.find_by(student_no: current_user.student_no, stamp_id: @get_stamp) != nil
      redirect_to :root, notice: "このスタンプは獲得済みです！" and return
    end

    GetStamp.create({student_no: current_user.student_no, number: @stamp.number, stamp_id: @stamp.stamp_id})
    redirect_to :root, notice: "スタンプGET！"
  end

  def logs
    @get_logs = GetStamp.all.order(created_at: "DESC")
  end
end
