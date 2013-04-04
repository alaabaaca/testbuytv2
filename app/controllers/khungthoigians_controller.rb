class KhungthoigiansController < ApplicationController
  # GET /khungthoigians
  # GET /khungthoigians.json
  def index
    @khungthoigians = Khungthoigian.paginate(:page => params[:page]).order('di ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @khungthoigians }
    end
  end

  # GET /khungthoigians/1
  # GET /khungthoigians/1.json
  def show
    @khungthoigian = Khungthoigian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @khungthoigian }
    end
  end

  # GET /khungthoigians/new
  # GET /khungthoigians/new.json
  def new
    @khungthoigian = Khungthoigian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @khungthoigian }
    end
  end

  # GET /khungthoigians/1/edit
  def edit
    @khungthoigian = Khungthoigian.find(params[:id])
  end

  # POST /khungthoigians
  # POST /khungthoigians.json
  def create
    @khungthoigian = Khungthoigian.new(params[:khungthoigian])

    respond_to do |format|
      if @khungthoigian.save
        format.html { redirect_to @khungthoigian, notice: 'Khungthoigian was successfully created.' }
        format.json { render json: @khungthoigian, status: :created, location: @khungthoigian }
      else
        format.html { render action: "new" }
        format.json { render json: @khungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /khungthoigians/1
  # PUT /khungthoigians/1.json
  def update
    @khungthoigian = Khungthoigian.find(params[:id])

    respond_to do |format|
      if @khungthoigian.update_attributes(params[:khungthoigian])
        format.html { redirect_to @khungthoigian, notice: 'Khungthoigian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @khungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /khungthoigians/1
  # DELETE /khungthoigians/1.json
  def destroy
    @khungthoigian = Khungthoigian.find(params[:id])
    @khungthoigian.destroy

    respond_to do |format|
      format.html { redirect_to khungthoigians_url }
      format.json { head :no_content }
    end
  end
end
