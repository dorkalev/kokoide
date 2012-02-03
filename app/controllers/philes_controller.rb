class PhilesController < ApplicationController
  # GET /philes
  # GET /philes.json
  def index
    @philes = Phile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @philes }
    end
  end

  # GET /philes/1
  # GET /philes/1.json
  def show
    @phile = File.read(params[:id].gsub('DOTDOT','.').gsub('SLASHSLASH','/'))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {content: @phile} }
    end
  end

  # GET /philes/new
  # GET /philes/new.json
  def new
    @phile = Phile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phile }
    end
  end

  # GET /philes/1/edit
  def edit
    @phile = Phile.find(params[:id])
  end

  # POST /philes
  # POST /philes.json
  def create
    @phile = Phile.new(params[:phile])

    respond_to do |format|
      if @phile.save
        format.html { redirect_to @phile, notice: 'Phile was successfully created.' }
        format.json { render json: @phile, status: :created, location: @phile }
      else
        format.html { render action: "new" }
        format.json { render json: @phile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /philes/1
  # PUT /philes/1.json
  def update
    fn = params[:id].gsub('DOTDOT','.').gsub('SLASHSLASH','/')
    File.open(fn,'w+') { |f| 
      f.puts params[:content]
    }
    respond_to do |format|
      format.json { render json: { success: true} }
    end
  end

  # DELETE /philes/1
  # DELETE /philes/1.json
  def destroy
    @phile = Phile.find(params[:id])
    @phile.destroy

    respond_to do |format|
      format.html { redirect_to philes_url }
      format.json { head :no_content }
    end
  end
end
