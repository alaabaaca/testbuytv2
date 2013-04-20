# encoding: UTF-8
class DiemtrentuyensController < ApplicationController
  authorize_resource
  skip_authorize_resource  :only => [:diemtrentuyens_android]


=begin
  before_filter :authenticate_user!

  before_filter :kiemtra_admin

  def kiemtra_admin
    if current_user.email != 'admin@buytcantho.com' then
      redirect_to root_path
    end
  end
=end

  # GET /diemtrentuyens
  # GET /diemtrentuyens.json
  def index
    @diemtrentuyens = Diemtrentuyen.paginate(:page => params[:page]).order('matuyen ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diemtrentuyens }
    end
  end

  # GET /diemtrentuyens/1
  # GET /diemtrentuyens/1.json
  def show
    @diemtrentuyen = Diemtrentuyen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diemtrentuyen }
    end
  end

  # GET /diemtrentuyens/new
  # GET /diemtrentuyens/new.json
  def new
    @diemtrentuyen = Diemtrentuyen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diemtrentuyen }
    end
  end

  # GET /diemtrentuyens/1/edit
  def edit
    @diemtrentuyen = Diemtrentuyen.find(params[:id])
  end

  # POST /diemtrentuyens
  # POST /diemtrentuyens.json
  def create
    @diemtrentuyen = Diemtrentuyen.new(params[:diemtrentuyen])

    respond_to do |format|
      if @diemtrentuyen.save
        format.html { redirect_to @diemtrentuyen, notice: 'Thêm điểm trên tuyến thành công.' }
        format.json { render json: @diemtrentuyen, status: :created, location: @diemtrentuyen }
      else
        format.html { render action: "new" }
        format.json { render json: @diemtrentuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diemtrentuyens/1
  # PUT /diemtrentuyens/1.json
  def update
    @diemtrentuyen = Diemtrentuyen.find(params[:id])

    respond_to do |format|
      if @diemtrentuyen.update_attributes(params[:diemtrentuyen])
        format.html { redirect_to @diemtrentuyen, notice: 'Cập nhật điểm trên tuyến thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diemtrentuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diemtrentuyens/1
  # DELETE /diemtrentuyens/1.json
  def destroy
    @diemtrentuyen = Diemtrentuyen.find(params[:id])
    @diemtrentuyen.destroy

    respond_to do |format|
      format.html { redirect_to diemtrentuyens_url }
      format.json { head :no_content }
    end
  end

  def diemtrentuyens_android
    #@diemtrentuyens  =  Diemtrentuyen.find_all_by_matuyen(params[:id])
    #@diemtrentuyens = Diemtrentuyen.find(:all, :order =>  sort_by('id'))
    @diemtrentuyens  =  Diemtrentuyen.find_all_by_matuyen(params[:id]).sort()
   # @diemtrentuyens.sort_by("id")
    @result = {"success" => 1, "diemtrentuyens" => @diemtrentuyens}
    render :json => @result
  end
end
