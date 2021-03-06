class AddressesController < ApplicationController
  before_action :set_address, only: %i[:show, :update, :destroy]

  # GET /addresses
  def index
    if params.key?(:line_one, :line_two, :city, :state, :zip_code)
    @addresses = Address.all.select do |address|
      next if address.line_one.nil?
      address.line_one.downcase.include? params [:line_one].downcase
      next if address.line_two.nil?
      address.line_two.downcase.include? params [:line_two].downcase
      next if address.city.nil?
      address.city.downcase.include? params [:city].downcase
      next if address.state.nil?
      address.state.downcase.include? params [:state].downcase
      next if address.zip_code.nil?
      address.zip_code.downcase.include? params [:zip_code].downcase
    end
    render json: @addresses
  end
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    store_id = params[:store_id]
    @address = Address.new(address_params.merge(store_id: store_id))

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
      params.require(:address).permit(:line_one, :line_two, :city, :state, :zip_code, :store)
    end
end
