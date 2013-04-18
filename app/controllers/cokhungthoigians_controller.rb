# encoding: UTF-8
class CokhungthoigiansController < ApplicationController
  load_and_authorize_resource :only => [:new, :create, :edit, :update, :show, :destroy]
  #skip_authorize_resource :only => [:index, :show, :cokhungtgs_android]

  # GET /cokhungthoigians
  # GET /cokhungthoigians.json
  def index
    require 'will_paginate/array'
    #@cokhungthoigians = Cokhungthoigian.all

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

          @chuyens = Chuyen.find_all_by_mact(@congty.id);

          @cokhungtgs = Array.new
          @chuyens.each do |bs|
            @cokhungtg = Cokhungthoigian.order('biensoxe ASC').find_all_by_biensoxe(bs.biensoxe)
            if (@cokhungtg != []) then

              @cokhungtg.each do |c|
                @cokhungtgs.append(c)
              end
              #@cokhungtgs.append(@cokhungtg)
            end
          end
          @cokhungthoigians = @cokhungtgs.paginate(:page => params[:page], :per_page => 10)
        end
      else
        @cokhungthoigians = Cokhungthoigian.paginate(:page => params[:page]).order('biensoxe ASC')
      end
    else
      @cokhungthoigians = Cokhungthoigian.paginate(:page => params[:page]).order('biensoxe ASC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cokhungthoigians }
    end
  end

  # GET /cokhungthoigians/1
  # GET /cokhungthoigians/1.json
  def show
    @cokhungthoigian = Cokhungthoigian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cokhungthoigian }
    end
  end

  # GET /cokhungthoigians/new
  # GET /cokhungthoigians/new.json
  def new
    @cokhungthoigian = Cokhungthoigian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cokhungthoigian }
    end
  end

  # GET /cokhungthoigians/1/edit
  def edit
    @cokhungthoigian = Cokhungthoigian.find(params[:id])
  end

  # POST /cokhungthoigians
  # POST /cokhungthoigians.json
  def create
    @cokhungthoigian = Cokhungthoigian.new(params[:cokhungthoigian])

    respond_to do |format|
      if @cokhungthoigian.save
        format.html { redirect_to @cokhungthoigian, notice: 'Thêm giờ chạy của chuyến xe thành công.' }
        format.json { render json: @cokhungthoigian, status: :created, location: @cokhungthoigian }
      else
        format.html { render action: "new" }
        format.json { render json: @cokhungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cokhungthoigians/1
  # PUT /cokhungthoigians/1.json
  def update
    @cokhungthoigian = Cokhungthoigian.find(params[:id])

    respond_to do |format|
      if @cokhungthoigian.update_attributes(params[:cokhungthoigian])
        format.html { redirect_to @cokhungthoigian, notice: 'Cập nhật giờ chạy của chuyến xe thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cokhungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cokhungthoigians/1
  # DELETE /cokhungthoigians/1.json
  def destroy
    @cokhungthoigian = Cokhungthoigian.find(params[:id])
    @cokhungthoigian.destroy

    respond_to do |format|
      format.html { redirect_to cokhungthoigians_url }
      format.json { head :no_content }
    end
  end

  def cokhungtgs_android
    puts "tessssssssssssssssssssst"
    puts params[:id]

    @cokhungtgs = Cokhungthoigian.find_all_by_biensoxe(params[:id])

    @khungtg = Array.new
    @luots = Array.new
    @cokhungtgs.each do |c|
      @tg = Khungthoigian.find_by_id(c.makhungtg)
      @chitiet = @tg.di.strftime("%H:%M:%S") + " - " + @tg.den.strftime("%H:%M:%S")
      @khungtg.append(@chitiet)

      @luot = Cokhungthoigian.find_by_id(c.id)
      @luots.append(@luot.luot)
    end

    @result = {"success" => 1, "khungtgs" => @khungtg, "luots" => @luots}
    render :json => @result
  end
end
