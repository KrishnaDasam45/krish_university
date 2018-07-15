class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.where('role_id != ?',1)
  end

  def show
  end

  def new
    @user = User.new
    @courses = Course.all
    @roles = Role.where('name != ?',"admin")
    @qualifications = Qualification.all
  end

  def create
    @user = User.new(user_params)
    @user.randmonpwd
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @courses = Course.all
    @roles = Role.where('name != ?',"admin")
    @qualifications = Qualification.all
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.update(is_active: false)
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def list_sub_partners
    if params[:qualification_id].present?
        if params[:qualification_id] == "1"          
          @partners = Course.where("qualification_id = ?",1)
        elsif params[:qualification_id] == "2"
          @partners = Course.where("qualification_id = ?",2)
        elsif params[:qualification_id] == "3"
          @partners = Course.where("qualification_id = ?",3)
        end 
        if !params[:payment_id].blank?
          selected_id = User.find(params[:payment_id]).course_id
          @selected = Course.find(selected_id).name if !selected_id.nil?
          # selected_id = Accounting::AccountPayment.find(params[:payment_id]).smerp_partner_id
          # @selected = SmerpPartner.find(selected_id).name if !selected_id.nil?
        else
          @selected = params[:course_id]
        end
      respond_to do |format|
        format.js
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:course_id,:role_id,:dob,:mobile,
       :address,:qualification_id,:gender,:is_active,:aadhar_no,:password,:password_confirmation)
    end
end