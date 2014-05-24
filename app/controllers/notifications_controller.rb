class NotificationsController < ApplicationController

  include TwitterCredentialsHelper

  before_action :set_notification, only: [:show, :edit, :update, :destroy, :push_twitter, :push_facebook]

  # GET /notifications
  # GET /notifications.json
  def index
    #@notifications = Notification.all
    @notifications = Notification.order('updated_at').page(params[:page]).per_page(10)
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  def push_twitter
    #Set all updates as success until a failure
    social_update_suc = true

    #Get the twitter client.
    client = get_twitter_client

    #Try a Twitter update, and report any errors.
    begin
      @notification.tweet_id = client.update(@notification.ndesc).id
    rescue => e
      flash[:alert] = "Twitter update failed, error: #{e.to_s}"
    end

    @notifications = Notification.all
    respond_to do |format|
      if social_update_suc && @notification.save
        flash[:success] = "Tweet updated successfully."

        format.html { render action: 'index' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def push_facebook
    begin
      Facebook.new.get_active_connection(current_user).put_wall_post(@notification.ndesc)
      flash[:success] = "Facebook updated successfully."
    rescue Koala::Facebook::ClientError => e
      flash[:alert] = "Facebook update failed, client error: "
      flash[:alert] += e.to_s
    rescue => e
      flash[:alert] = "Facebook update failed, error: #{e.to_s}"
    end

    @notifications = Notification.all
    respond_to do |format|
      if flash[:success]
        format.html { render action: 'index' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :ndesc)
    end
end
