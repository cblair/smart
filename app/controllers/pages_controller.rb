class PagesController < ApplicationController

  include TwitterCredentialsHelper

  before_action :set_page, only: [
    :show,
    :edit,
    #Not for update, since its now for PageChunks
    #:update,
    :destroy]

  before_filter :authenticate_user!, except: [:index, :show, :home]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/1
  # GET /pages/1.json
  def home
    @page = Page.find_or_create_by(name: "home")
    @images = Dir.glob("app/assets/images/home_banner/cropped/*.jpg")
    @twitter_client = get_twitter_client
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    #Mercury update for PageChunk (instead of the Page update stuff)
    @page_chunk = PageChunk.find(params[:page_chunk_id])
    #TODO: Not sure why "undefined" is a key.
    @page_chunk.content = params[:content][:undefined][:value]
    @page_chunk.save!

    render text: ""
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :page_chunk_id)
    end
end
