class PageChunksController < ApplicationController
  before_action :set_page_chunk, only: [:show, :edit, :update, :destroy]

  # GET /page_chunks
  # GET /page_chunks.json
  def index
    @page_chunks = PageChunk.all
  end

  # GET /page_chunks/1
  # GET /page_chunks/1.json
  def show
  end

  # GET /page_chunks/new
  def new
    @page_chunk = PageChunk.new
  end

  # GET /page_chunks/1/edit
  def edit
  end

  # POST /page_chunks
  # POST /page_chunks.json
  def create
    @page_chunk = PageChunk.new(page_chunk_params)

    respond_to do |format|
      if @page_chunk.save
        format.html { redirect_to @page_chunk, notice: 'Page chunk was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page_chunk }
      else
        format.html { render action: 'new' }
        format.json { render json: @page_chunk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_chunks/1
  # PATCH/PUT /page_chunks/1.json
  def update
    @page_chunk = PageChunk.find(params[:id])
    #TODO: Not sure why "undefined" is a key.
    #TODO: multiple editable section on one page not working; the content for the last
    # is always 
    @page_chunk.content = params[:content][:undefined][:value]
    @page_chunk.save!

    render text: ""
=begin
    respond_to do |format|
      if @page_chunk.update(page_chunk_params)
        format.html { redirect_to @page_chunk, notice: 'Page chunk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page_chunk.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /page_chunks/1
  # DELETE /page_chunks/1.json
  def destroy
    @page_chunk.destroy
    respond_to do |format|
      format.html { redirect_to page_chunks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_chunk
      @page_chunk = PageChunk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_chunk_params
      params.require(:page_chunk).permit(:name, :content)
    end
end
