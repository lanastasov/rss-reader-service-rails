class RssurlsController < ApplicationController
  before_action :set_rssurl, only: %i[ show edit update destroy ]

  # GET /rssurls or /rssurls.json
  def index
    @rssurls = Rssurl.all
  end

  # GET /rssurls/1 or /rssurls/1.json
  def show
  end

  # GET /rssurls/new
  def new
    @rssurl = Rssurl.new
  end

  # GET /rssurls/1/edit
  def edit
  end

  # POST /rssurls or /rssurls.json
  def create
    @rssurl = Rssurl.new(rssurl_params)

    respond_to do |format|
      if @rssurl.save
        format.html { redirect_to @rssurl, notice: "Rssurl was successfully created." }
        format.json { render :show, status: :created, location: @rssurl }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rssurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rssurls/1 or /rssurls/1.json
  def update
    respond_to do |format|
      if @rssurl.update(rssurl_params)
        format.html { redirect_to @rssurl, notice: "Rssurl was successfully updated." }
        format.json { render :show, status: :ok, location: @rssurl }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rssurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rssurls/1 or /rssurls/1.json
  def destroy
    @rssurl.destroy
    respond_to do |format|
      format.html { redirect_to rssurls_url, notice: "Rssurl was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rssurl
      @rssurl = Rssurl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rssurl_params
      params.require(:rssurl).permit(:url)
    end
end
