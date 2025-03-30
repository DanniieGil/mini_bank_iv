class Client < User
  has_many :accounts, foreign_key: "client_id"

  def show_information
    super + " - Cliente"
  end

  def show_all_accounts
    if accounts.any?
      accounts.each do |account|
        puts account.show_details
      end
    else
      puts "No hay cuentas"
    end
  end
end
