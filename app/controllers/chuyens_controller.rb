# encoding: UTF-8
class ChuyensController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource  :only => [:index, :show, :chuyens_tram_android
    , :chuyens_tuyen_android, :chuyens_android]

  # GET /chuyens
  # GET /chuyens.json
  def index
    if (user_signed_in?) then
      @user = User.find_by_email(current_user.email)
      @coquyen = RolesUser.find_by_user_id(@user.id)
      @quyen = Role.find_by_id(@coquyen.role_id)
      if @quyen.name != 'Admin' then
        session[:taikhoan] = current_user.email
        @t = session[:taikhoan]

        @taikhoan = Taikhoan.find_by_tentk(@t)
        if (@taikhoan != nil) then
          @congty = Congty.find_by_id(@taikhoan.mact)
          @chuyens = Chuyen.paginate(:page => params[:page]).order('biensoxe ASC').find_all_by_mact(@congty.id)
        end
      else
        @chuyens = Chuyen.paginate(:page => params[:page]).order('biensoxe ASC')
      end
    else
      @chuyens = Chuyen.paginate(:page => params[:page]).order('biensoxe ASC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chuyens }
    end
  end


  # GET /chuyens/1
  # GET /chuyens/1.json
  def show
    @chuyen = Chuyen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chuyen }
    end
  end

  # GET /chuyens/new
  # GET /chuyens/new.json
  def new
    @chuyen = Chuyen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chuyen }
    end
  end

  # GET /chuyens/1/edit
  def edit
    @chuyen = Chuyen.find(params[:id])
    #authorize! :update, @chuyen
  end

  # POST /chuyens
  # POST /chuyens.json
  def create
    @chuyen = Chuyen.new(params[:chuyen])

    respond_to do |format|
      if @chuyen.save
        #format.html { redirect_to @chuyen, notice: 'Chuyen was successfully created.' }
        format.html { redirect_to @chuyen, notice: 'Thêm chuyến thành công.' }
        format.json { render json: @chuyen, status: :created, location: @chuyen }
      else
        format.html { render action: "new" }
        format.json { render json: @chuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chuyens/1
  # PUT /chuyens/1.json
  def update
    @chuyen = Chuyen.find(params[:id])

    respond_to do |format|
      if @chuyen.update_attributes(params[:chuyen])
        format.html { redirect_to @chuyen, notice: 'Cập nhật chuyến thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chuyens/1
  # DELETE /chuyens/1.json
  def destroy
    @chuyen = Chuyen.find(params[:id])
    @chuyen.destroy

    respond_to do |format|
      format.html { redirect_to chuyens_url }
      format.json { head :no_content }
    end
  end

  def chuyens_android
    @chuyens = Chuyen.all

    result = {"success" => 1, "chuyens" => @chuyens}
    render :json => result
  end


  def chuyens_tuyen_android
    # @tuyen = Tuyen.find_by_id(params[:id])
    #@chuyens = Chuyen.find_all_by_matuyen(@tuyen.matuyen)
    @chuyens = Chuyen.order('biensoxe ASC').find_all_by_matuyen(params[:id])

    @congties = Array.new
    @tuyens = Tuyen.find_by_id(params[:id])

    @chuyens.each do |c|
      @congty = Congty.find_by_id(c.mact)
      @congties.append(@congty.tenct)
    end
    @tuyen = @tuyens.tentuyen + " - " + @tuyens.tentuyen2

    @result = {"success" => 1, "chuyens" => @chuyens, "congties" => @congties, "tuyens" => @tuyen}
    #@result = {"success" => 1, "chuyens" => @chuyens}
    render :json => @result
  end

  def chuyens_congty_android
    @congty = Congty.find_by_id(params[:id])
    @chuyens = Chuyen.find_all_by_mact(@congty.id)

    @congties = Congty.find_by_id(params[:id])
    @congty = @congties.tenct

    @tuyens = Array.new
    @chuyens.each do |c|
      @tuyen = Tuyen.find_by_id(c.matuyen)
      @ten = @tuyen.tentuyen + " - " + @tuyen.tentuyen2
      @tuyens.append(@tuyen)
    end

    @result = {"success" => 1, "chuyens" => @chuyens, "tuyens" => @tuyens, "congties" => @congty}
    render :json => @result
  end

  def chuyens_tram_android
    @diquatrams = Diquatram.order('matuyen ASC').find_all_by_matram(params[:id])
    @chuyens = Array.new
    @tuyens = Array.new
    @congties = Array.new

    @diquatrams.each do |d|
      @chuyen = Chuyen.find_by_matuyen(d.matuyen)
      @chuyens.append(@chuyen)

      @tuyen = Tuyen.find_by_id(d.matuyen)
      @ten = @tuyen.tentuyen + " - " + @tuyen.tentuyen2
      @tuyens.append(@ten)

      @congty = Congty.find_by_id(@chuyen.mact)
      @congties.append(@congty.tenct)
    end


    @result = {"success" => 1, "chuyens" => @chuyens, "tuyens" => @tuyens, "congties" => @congties}
    render :json => @result
  end
end
