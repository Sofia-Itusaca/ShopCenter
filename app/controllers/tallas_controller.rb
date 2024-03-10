class TallasController < ApplicationController
  before_action :authorize!
  def index
    @tallas = Talla.all
  end


  # GET /tallas/new
  def new
    @talla = Talla.new
  end

  # GET /tallas/1/edit
  def edit
    talla
  end

  # POST /tallas or /tallas.json
  def create
    @talla = Talla.new(talla_params)

    respond_to do |format|
      if @talla.save
        format.html { redirect_to tallas_url, notice: "Talla was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tallas/1 or /tallas/1.json
  def update
    if talla.update(talla_params)
      redirect_to tallas_url, notice: "CATEGORIA ACTUALIZADA CORRECTAMENTE" 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tallas/1 or /tallas/1.json
  def destroy
    talla.destroy
    redirect_to tallas_url, alert: "CATEGORIA ELIMINADA CORRECTAMENTE"
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def talla
      @talla = Talla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def talla_params
      params.require(:talla).permit(:name)
    end
end
