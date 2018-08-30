class StoresUsersController < ApplicationController
  before_action :set_stores_user, only: [show, update, destroy]

  # GET /stores
  def index
    @stores_users = StoresUser.all

    render json: @stores_users
  end

  # GET /stores/1
  def show
    render json: @stores_user
  end

  # POST /stores
  def create
    store_id = params[:store_id]
    user_id = params[:user_id]
    @stores_user = StoresUser.new(stores_user_params.merge(store_id: store_id, user_id: user_id))

    if @stores_user.save
      render json: @stores_user, status: :created, location: @stores_user
    else
      render json: @stores_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores
  def update
    if @stores_user.update(stores_user_params)
      render json: @stores_user
    else
      render json: @stores_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores
  def delete
    @stores_user.delete
  end

  private
  # Use callbacks to share common set up or constraints between actions.
  def set_stores_user
    @stores_user = StoresUser.find(params[:id])
  end

  # Only allow trusted params to "white list" through.
  def stores_user_params
    params.require(:stores_user).permit(:store_id, :user_id)
  end
end
