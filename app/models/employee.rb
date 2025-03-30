class Employee < User
  validates :salary, presence: true, numericality: { greater_than: 0 }

  def calculate_bonus(percentage)
    salary * (percentage / 100.0)
  end

  def show_information
    super + " - Empleado - salario: $#{salary}"
  end
end
