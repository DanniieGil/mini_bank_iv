class BankingController < ApplicationController
  def index
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = if params[:user][:type] == "Client"
              Client.new(user_params)
    else
              Employee.new(user_params)
    end

    if @user.save
      redirect_to banking_index_path, notice: "Usuario creado exitosamente."
    else
      render :new_user, status: :unprocessable_entity
    end
  end

  def new_account
    @client = Client.find(params[:client_id])
    @account = @client.accounts.build
  end

  def create_account
    @client = Client.find(params[:client_id])
    @account = @client.accounts.build(account_params)

    if @account.save
      redirect_to show_accounts_banking_index_path(client_id: @client.id), notice: "Cuenta creada exitosamente."
    else
      render :new_account, status: :unprocessable_entity
    end
  end

  def new_transaction
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build
  end

  def create_transaction
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build(transaction_params)

    if @transaction.save
      result = case @transaction.transaction_type
      when "deposit"
        @account.deposit(@transaction.amount)
      when "withdraw"
        @account.withdraw(@transaction.amount)
      end
      redirect_to transaction_history_banking_index_path(account_id: @account.id), notice: result
    else
      render :new_transaction, status: :unprocessable_entity
    end
  end

  def calculate_bonus
    @employee = Employee.find(params[:employee_id])
    percentage = params[:percentage].to_f
    @bonus = @employee.calculate_bonus(percentage)
    render :bonus_result
  end

  def show_accounts
    @client = Client.find(params[:client_id])
    @accounts = @client.accounts
  end

  def transaction_history
    @account = Account.find(params[:account_id])
    @transactions = @account.transactions.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:identification, :names, :salary, :type)
  end

  def account_params
    params.require(:account).permit(:account_type, :balance)
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount)
  end
end
