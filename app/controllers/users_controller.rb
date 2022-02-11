class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action -> {access_control(5)}
    # GET /problems or /problems.json
    def index
      @act_users = User.where.not(role_flag: 1)
      @ok_users = User.where(role_flag: 1).where.not(confirmed_at: nil).order(id: "DESC")
      @not_users = User.where(confirmed_at: nil)
    end
  
    # GET /problems/1 or /problems/1.json
    def show
      @get_logs = GetStamp.all.where(student_no: User.find(params[:id]).student_no)
      if @user.confirmed_at.nil?
        @confirme = "認証待ち"
      else
        @confirme = "認証済み"
      end
      begin
        @last_sign_in_at = @user.last_sign_in_at.strftime("%Y年%m月%d日%H時%M分")
      rescue
        @last_sign_in_at = "履歴なし"       
      end
      
    end
  
    # GET /problems/1/edit
    def edit
    end

      # POST /problems or /problems.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "新規作成しました！" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
    # PATCH/PUT /problems/1 or /problems/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "更新しました！" }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /problems/1 or /problems/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "削除しました！" }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:student_no,:name,:role_flag, :point)
      end
  
  end