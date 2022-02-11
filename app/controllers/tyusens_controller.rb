class TyusensController < ApplicationController
  before_action -> {access_control(3)}
  def hinamatsuri
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = 0
    Prize.all.each do |prize|
      @prize_cnt += prize.qty if prize.kind == "ひなまつり"
    end
  end

  def valentine
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = 0
    Prize.all.each do |prize|
      @prize_cnt += prize.qty if prize.kind == "バレンタイン"
    end
  end

  def lottery  
    qr = tyusen_params
    session[:prize] = ""
    user = User.find_by(id: qr.slice(0..6).to_i / 16)
    
    if user.nil? or qr.length != 15
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to  request.referer and return
    elsif request.referer.include?("valentine")
      if !Tyusen.find_by(student_no: user.student_no, kind: "バレンタイン").nil?
        flash[:alert] = "既に抽選に参加済みです"
        redirect_to  request.referer and return
      end
      prize_list = []
      Prize.where(kind: "バレンタイン").each do |prize|
        prize.qty.times do |time|
          prize_list.append(prize.prize)
        end
      end
      result = prize_list[rand(0..Prize.where(kind: "バレンタイン").sum(:qty)-1)]
      prize = Prize.find_by(prize: result)
      session[:prize] = Prize.find_by(prize: result)
      Tyusen.create({student_no: user.student_no, kind: "バレンタイン", prize: result})
      prize.update(prize: prize.prize, kind: "バレンタイン", qty: prize.qty - 1, category: prize.category)  
    
    elsif request.referer.include?("hinamatsuri")
      if !Tyusen.find_by(student_no: user.student_no, kind: "ひなまつり").nil?
        flash[:alert] = "既に抽選に参加済みです"
        redirect_to  request.referer and return
      end
      Prize.where(kind: "ひなまつり").sum(:qty).times do
      user_stamp = GetStamp.where(student_no: qr.slice(6..-1)).count
      if user_stamp <= 2
        if Prize.where(kind: "ひなまつり", category: "参加賞").sum(:qty) <= 0
          redirect_to  request.referer, alert: "かまトゥグッズが無くなりました" and return
        else
          session[:prize] = Prize.find_by(kind: "ひなまつり", prize: "かまトゥグッズ")
          Tyusen.create(student_no: user.student_no, kind: "ひなまつり", prize: "かまトゥグッズ")
          prize = Prize.find_by(kind: "ひなまつり", prize: "かまトゥグッズ")
          prize.update(prize: "かまトゥグッズ", kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
        end
        elsif user_stamp <= 4
          if Prize.where.not(kind: "ひなまつり", category: "豪華").sum(:qty) <= 0
            redirect_to  request.referer, alert: "中間・かまトゥグッズが無くなりました" and return
          else
            prize_random_middle(user.student_no)
          end
        else
          prize_random_all(user.student_no)
        end
      end
    end
  end

  def prize_random_all(student_no)
    prize_list = []
    Prize.where(kind: "ひなまつり").each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..Prize.where(kind: "ひなまつり").sum(:qty)-1)]
    prize = Prize.find_by(kind: "ひなまつり", prize: result)
    session[:prize] = prize
    p [result, prize]
    Tyusen.create({student_no: student_no, kind: "ひなまつり", prize: result})
    prize.update(prize: prize.prize, kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
  end

  def prize_random_middle(student_no)
    prize_list = []    
    Prize.where(kind: "ひなまつり").where.not(category: "豪華").each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..Prize.where(kind: "ひなまつり").where.not(category: "豪華").sum(:qty)-1)]
    prize = Prize.find_by(kind: "ひなまつり", prize: result)
    p [result, prize]
    session[:prize] = prize
    Tyusen.create(student_no: student_no, kind: "ひなまつり", prize: result)
    prize.update(prize: prize.prize, kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
  end

  def tyusen_params
    params[:student_no]
  end

end
