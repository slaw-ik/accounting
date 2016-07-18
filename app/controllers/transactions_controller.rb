class TransactionsController < ApplicationController
  before_action :set_account
  before_action :set_transaction, only: [:update, :destroy]
  respond_to :json, only: [:create, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @account.transactions.where('name LIKE ?', "%#{params[:name]}%")
  end

  # POST /transactions.json
  def create
    @transaction = @account.transactions.build(transaction_params)

    if @transaction.save
      render :show, status: :created, location: [@account, @transaction]
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1.json
  def update
    if @transaction.update(transaction_params)
      render :show, status: :ok, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    render nothing: true, status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = current_user.accounts.find(params[:account_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = @account.transactions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.permit(:name, :sum, :category_id)
  end
end
