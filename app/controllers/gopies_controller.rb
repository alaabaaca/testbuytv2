class GopiesController < ApplicationController
  authorize_resource
  skip_authorize_resource :only => [:gopies_android]

  # GET /gopies
  # GET /gopies.json
  def index
    require 'will_paginate/array'

    session[:taikhoan] = current_user.email
    @t = session[:taikhoan]

      @taikhoan = User.find_by_email(@t)
    if (@taikhoan != nil) then
      @congty = Congty.find_by_id(@taikhoan.mact)

      @chuyens = Chuyen.order('biensoxe ASC').find_all_by_mact(@congty.id);

      #@gopies = Array.new
      @gop =  []
      @chuyens.each do |bs|
        @gopy = Gopy.order('ngay ASC').find_all_by_biensoxe(bs.biensoxe)
        if (@gopy != []) then
          #@gopies.append(@gopy)
          @gopy.each do |g|
            @gop << g
          end
        end
      end
       @gopies = @gop.paginate(:page => params[:page], :per_page => 10)
    end





    #@gopies = Gopy.find_all_by_congty(@congty.id)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gopies }
    end
  end

  def gopies_android
    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxparams[:gopy]xx"
    puts params[:gopy]
    @gopy = Gopy.new(params[:gopy])
    if @gopy.save
      render :json => {"status" => 200}
    else
      render :json => {"status" => 403}
    end
  end

  # GET /gopies/1
  # GET /gopies/1.json
  def show
    @gopy = Gopy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gopy }
    end
  end

  # GET /gopies/new
  # GET /gopies/new.json
  def new
    @gopy = Gopy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gopy }
    end
  end

  # GET /gopies/1/edit
  def edit
    @gopy = Gopy.find(params[:id])
  end

  # POST /gopies
  # POST /gopies.json
  def create
    @gopy = Gopy.new(params[:gopy])


    respond_to do |format|
      if @gopy.save
        format.html { redirect_to @gopy, notice: 'Gopy was successfully created.' }
        format.json { render json: @gopy, status: :created, location: @gopy }
      else
        format.html { render action: "new" }
        format.json { render json: @gopy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gopies/1
  # PUT /gopies/1.json
  def update
    @gopy = Gopy.find(params[:id])

    respond_to do |format|
      if @gopy.update_attributes(params[:gopy])
        format.html { redirect_to @gopy, notice: 'Gopy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gopy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gopies/1
  # DELETE /gopies/1.json
  def destroy
    @gopy = Gopy.find(params[:id])
    @gopy.destroy

    respond_to do |format|
      format.html { redirect_to gopies_url }
      format.json { head :no_content }
    end
  end
end
