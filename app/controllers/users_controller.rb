#This class only handles listing the users. Devise handles all other user routes.

class UsersController < ApplicationController

    before_action :set_user, only: ["update"]
    before_filter :authenticate_user!,

    # GET /pages
    # GET /pages.json
    def index
        @users = User.order(:email)
    end

    # PATCH /pages/1
    # PATCH /pages/1.json
    def update
        #Only change approvals for now.
        @user.approved = params[:user][:approved]
        respond_to do |format|
          if @user.save
            format.html { redirect_to users_path, notice: 'User was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end