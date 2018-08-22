class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    if params.key?('line_one', 'line_two', 'city', 'state', 'zip_code')
    @addresses = Address.all.select do |address|
      address.line_one.downcase.include? params ['line_one'].downcase
      address.line_two.downcase.include? params ['line_two'].downcase
      address.city.downcase.include? params ['city'].downcase
      address.state.downcase.include? params ['state'].downcase
      address.zip_code.downcase.include? params ['zip_code'].downcase
    end
    render json: Store.where? @address.params[:id] == Store.address_id

  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:line_one, :line_two, :city, :state, :zip_code)
    end
end
