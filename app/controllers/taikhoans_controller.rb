class TaikhoansController < ApplicationController

  before_filter :kiemtra_admin

  def kiemtra_admin
    if current_user.admin != 1 then
      redirect_to root_path
    end
  end


  # GET /taikhoans
  # GET /taikhoans.json



  def index
    @taikhoans = Taikhoan.paginate(:page => params[:page]).order('tentk ASC')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taikhoans }
    end
  end

  # GET /taikhoans/1
  # GET /taikhoans/1.json
  def show
    @taikhoan = Taikhoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taikhoan }
    end
  end

  # GET /taikhoans/new
  # GET /taikhoans/new.json
  def new
    @taikhoan = Taikhoan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taikhoan }
    end
  end

  # GET /taikhoans/1/edit
  def edit
    @taikhoan = Taikhoan.find(params[:id])
  end

  # POST /taikhoans
  # POST /taikhoans.json
  def create
    @taikhoan = Taikhoan.new(params[:taikhoan])

    respond_to do |format|
      if @taikhoan.save
        format.html { redirect_to @taikhoan, notice: 'Taikhoan was successfully created.' }
        format.json { render json: @taikhoan, status: :created, location: @taikhoan }
      else
        format.html { render action: "new" }
        format.json { render json: @taikhoan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taikhoans/1
  # PUT /taikhoans/1.json
  def update
    @taikhoan = Taikhoan.find(params[:id])

    respond_to do |format|
      if @taikhoan.update_attributes(params[:taikhoan])
        format.html { redirect_to @taikhoan, notice: 'Taikhoan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taikhoan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taikhoans/1
  # DELETE /taikhoans/1.json
  def destroy
    @taikhoan = Taikhoan.find(params[:id])
    @taikhoan.destroy

    respond_to do |format|
      format.html { redirect_to taikhoans_url }
      format.json { head :no_content }
    end
  end


end
