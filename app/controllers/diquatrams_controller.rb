class DiquatramsController < ApplicationController

  before_filter :authenticate_user!

  before_filter :kiemtra_admin

  def kiemtra_admin
    if current_user.admin != 1 then
      redirect_to root_path
    end
  end

  # GET /diquatrams
  # GET /diquatrams.json
  def index
    @diquatrams = Diquatram.paginate(:page => params[:page]).order('matuyen ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diquatrams }
    end
  end

  def diquatrams_android
    @diquatrams = Diquatram.find_all_by_matuyen(params[:id])

    @trams     = Array.new
    @diquatrams.each do |d|
      @tram = Tramdung.find_all_by_id(d.matram)
      @trams.append(@tram)
    end

    @result ={"success" => 1, "trams" => @trams}

    render :json => @result
  end


  # GET /diquatrams/1
  # GET /diquatrams/1.json
  def show
    @diquatram = Diquatram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diquatram }
    end
  end

  # GET /diquatrams/new
  # GET /diquatrams/new.json
  def new
    @diquatram = Diquatram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diquatram }
    end
  end

  # GET /diquatrams/1/edit
  def edit
    @diquatram = Diquatram.find(params[:id])
  end

  # POST /diquatrams
  # POST /diquatrams.json
  def create
    @diquatram = Diquatram.new(params[:diquatram])

    respond_to do |format|
      if @diquatram.save
        format.html { redirect_to @diquatram, notice: 'Diquatram was successfully created.' }
        format.json { render json: @diquatram, status: :created, location: @diquatram }
      else
        format.html { render action: "new" }
        format.json { render json: @diquatram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diquatrams/1
  # PUT /diquatrams/1.json
  def update
    @diquatram = Diquatram.find(params[:id])

    respond_to do |format|
      if @diquatram.update_attributes(params[:diquatram])
        format.html { redirect_to @diquatram, notice: 'Diquatram was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diquatram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diquatrams/1
  # DELETE /diquatrams/1.json
  def destroy
    @diquatram = Diquatram.find(params[:id])
    @diquatram.destroy

    respond_to do |format|
      format.html { redirect_to diquatrams_url }
      format.json { head :no_content }
    end
  end

  def diquatrams_tuyen_android
    @diquatrams = Diquatram.find_all_by_matuyen(params[:id])
    @trams = Array.new
    @diquatrams.each do |d|
      @tram = Tramdung.find_by_id(d.matram)
      @trams.append(@tram)
    end
    @result = {"success" => 1, "trams" => @trams }
    render :json => @result
  end
end
