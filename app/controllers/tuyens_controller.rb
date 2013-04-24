# encoding: UTF-8
class TuyensController < ApplicationController
  authorize_resource
  skip_authorize_resource :only => [:index, :show, :tuyens_android, :tuyens_timtheotramcuoi_android,
                                    :tuyens_timtheotramdau_android, :tuyens_timtheoma_android, :tuyens_tram_android,
                                    :tuyens_timtheotentuyen_android, :tuyens_autotext_ten_android, :tuyens_autotext_ten2_android]


  #before_filter :authenticate_user!, :kiemtra_quyen, :except => [:tuyens_tram_android,
  #                                              :tuyens_timtheoma_android, :tuyens_timtheotramdau_android,
  #                                              :tuyens_timtheotramcuoi_android, :tuyens_android]

  def kiemtra_quyen
    if  user_signed_in?
      if current_user.admin == 1 then
        session[:quyen] = 'admin'
      else
        @taikhoan = Taikhoan.find_by_tentk(current_user.email);

        if @taikhoan == nil
          session[:quyen] = 'khach'
        else
          session[:quyen] = 'congty'
        end
      end
    else
      session[:quyen] = 'khach'
    end
  end


  # GET /tuyens
  # GET /tuyens.json
  def index
    @tuyens = Tuyen.paginate(:page => params[:page]).order('matuyen ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tuyens }
    end
  end


  # GET /tuyens/1
  # GET /tuyens/1.json
  def show
    @tuyen = Tuyen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tuyen }
    end
  end

  # GET /tuyens/new
  # GET /tuyens/new.json
  def new
    @tuyen = Tuyen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tuyen }
    end
  end

  # GET /tuyens/1/edit
  def edit
    @tuyen = Tuyen.find(params[:id])
  end

  # POST /tuyens
  # POST /tuyens.json
  def create
    @tuyen = Tuyen.new(params[:tuyen])

    respond_to do |format|
      if @tuyen.save
        format.html { redirect_to @tuyen, notice: 'Thêm tuyến thành công.' }
        format.json { render json: @tuyen, status: :created, location: @tuyen }
      else
        format.html { render action: "new" }
        format.json { render json: @tuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tuyens/1
  # PUT /tuyens/1.json
  def update
    @tuyen = Tuyen.find(params[:id])

    respond_to do |format|
      if @tuyen.update_attributes(params[:tuyen])
        format.html { redirect_to @tuyen, notice: 'Cập nhật tuyến thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuyens/1
  # DELETE /tuyens/1.json
  def destroy
    @tuyen = Tuyen.find(params[:id])
    @tuyen.destroy

    respond_to do |format|
      format.html { redirect_to tuyens_url }
      format.json { head :no_content }
    end
  end

  def tuyens_android
    @tuyens = Tuyen.order('matuyen ASC').all
    result = {"success" => 1, "tuyens" => @tuyens}
    #result = []#{name: @tuyens.first.culy}
    #@tuyens.each do |tuyen|
    # result << {"culy" => tuyen.culy}
    #end
    render :json => result
    #render :json =>
    #render :json => @tuyens
    #respond_to do |format|
    # format.html # index.html.erb
    #  format.json { render :json => @tuyens }
    #end

  end


  def tuyens_tram_android
    @diquatrams = Diquatram.order('matuyen ASC').find_all_by_matram(params[:id])
    @tuyens = Array.new

    @diquatrams.each do |d|
      @tuyen = Tuyen.find_by_matuyen(d.matuyen)
      @tuyens.append(@tuyen)
    end

    @result = {"success" => 1, "tuyens" => @tuyens}
    render :json => @result
  end

  def tuyens_timtheoma_android
    #@tuyens = nil
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    @tuyens = Tuyen.order('matuyen ASC').find_all_by_matuyen(params[:id])


      @result = {"success" => "1", "tuyens" => @tuyens}

    render :json => @result
  end

  def tuyens_timtheotramdau_android
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #puts params[:id]
    @tuyens = Tuyen.order('matuyen ASC').find_all_by_tentuyen(params[:id])

    @result = {"success" => "1", "tuyens" => @tuyens}
    render :json => @result
  end

  def tuyens_timtheotramcuoi_android
    #puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #puts params[:id]
    @tuyens = Tuyen.order('matuyen ASC').find_all_by_tentuyen2(params[:id])

    @result = {"success" => "1", "tuyens" => @tuyens}
    render :json => @result
  end
  
  def tuyens_timtheotentuyen_android
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    puts params[:tentuyen]
    puts params[:tentuyen2]
    @tuyens = Tuyen.order("matuyen ASC").where(:tentuyen => params[:tentuyen]).where(:tentuyen2 => params[:tentuyen2]).first 
    #@tuyens = Tuyen.find_by_id("1")
    #@tuyens = Tuyen.all
    
    @result = {"success" => "1", "tuyens" => @tuyens}
    render :json => @result
  end
  
  def tuyens_autotext_ten_android
    @tuyens = Tuyen.order('tentuyen ASC').all
    result = {"success" => 1, "tuyens" => @tuyens}
    render :json => result
  end
  
  def tuyens_autotext_ten2_android
    @tuyens = Tuyen.order('tentuyen2 ASC').all
    result = {"success" => 1, "tuyens" => @tuyens}
    render :json => result
  end

end
