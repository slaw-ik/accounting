class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  respond_to :json, only: [:create, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts.filter_conditions(params[:name])
  end

  # POST /accounts.json
  def create
    @account = current_user.accounts.build(account_params)

    if @account.save
      render :show, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1.json
  def update
    if @account.update(account_params)
      render :show, status: :ok, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    render nothing: true, status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = current_user.accounts.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.permit(:name, :critical_sum, :notify)
  end
end
