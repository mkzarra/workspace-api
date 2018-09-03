class StoresUsersController < OpenReadController
  before_action :set_stores_user, only: %i[show, update, destroy]

  # GET /stores
  def show
    @stores_users = current_user.stores.all

    render json: @stores_users
  end

  # POST /stores
  def create
    @stores_user = StoresUser.new(stores_user_params)

    if @stores_user.save
      render json: @stores_user, status: :created
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
  def destroy
    @stores_user.destroy
  end

  private
  # Use callbacks to share common set up or constraints between actions.
  def set_stores_user
    if params[:id]
      @stores_user = StoresUser.find(params[:id])
    elsif stores_user_params[:store_id] && stores_user_params[:user_id]
      @stores_user = StoresUser.find_by(store_id: stores_user_params[:store_id], user_id: stores_user_params[:user_id])
    end
  end

  # Only allow trusted params to "white list" through.
  def stores_user_params
    params.require(:stores_user).permit(:id, :store_id, :user_id)
  end
end
