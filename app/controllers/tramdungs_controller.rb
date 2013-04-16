# encoding: UTF-8
class TramdungsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource  :only => [:index, :show, :tramdungs_android]

=begin
  before_filter :authenticate_user!

  before_filter :kiemtra_admin

  def kiemtra_admin
    if current_user.email != 'admin@buytcantho.com' then
      redirect_to root_path
    end
  end
=end

  # GET /tramdungs
  # GET /tramdungs.json
  def index
    @tramdungs = Tramdung.paginate(:page => params[:page]).order('tentram ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tramdungs }
    end
  end



  # GET /tramdungs/1
  # GET /tramdungs/1.json
  def show
    @tramdung = Tramdung.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tramdung }
    end
  end

  # GET /tramdungs/new
  # GET /tramdungs/new.json
  def new
    @tramdung = Tramdung.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tramdung }
    end
  end

  # GET /tramdungs/1/edit
  def edit
    @tramdung = Tramdung.find(params[:id])
  end

  # POST /tramdungs
  # POST /tramdungs.json
  def create
    @tramdung = Tramdung.new(params[:tramdung])

    respond_to do |format|
      if @tramdung.save
        format.html { redirect_to @tramdung, notice: 'Thêm trạm dừng thành công.' }
        format.json { render json: @tramdung, status: :created, location: @tramdung }
      else
        format.html { render action: "new" }
        format.json { render json: @tramdung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tramdungs/1
  # PUT /tramdungs/1.json
  def update
    @tramdung = Tramdung.find(params[:id])

    respond_to do |format|
      if @tramdung.update_attributes(params[:tramdung])
        format.html { redirect_to @tramdung, notice: 'Cập nhật trạm dừng thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tramdung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tramdungs/1
  # DELETE /tramdungs/1.json
  def destroy
    @tramdung = Tramdung.find(params[:id])
    @tramdung.destroy

    respond_to do |format|
      format.html { redirect_to tramdungs_url }
      format.json { head :no_content }
    end
  end
end


def tramdungs_android
  @tramdungs = Tramdung.all

  result = {"success" => 1, "tramdungs" => @tramdungs}
  render :json => result

end