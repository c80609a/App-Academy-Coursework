class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier.to_i
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self)
  end

  def remove_boss
    @boss = nil
  end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    # bonus = (total salary of all sub-employees) * multiplier
    salary_sum = @employees.reduce(0) { |acc, emp| acc + emp.salary}
    bonus = salary_sum * multiplier
  end

  def employees
    @employees.dup
  end

  def add_employee(employee)
    unless @employees.include?(employee)
    old_boss = employee.boss
    employee.boss = self
    @employees << employee
    old_boss.remove_employee(employee)
    end
  end

  def remove_employee(employee)
    @employees.delete(employee)
  end

end

Manager.new("Ned", "Founder", 1000000)
Manager.new("Darren", "TA Manager", 78000)
Employee.new("Shawna", "TA", 12000)
Employee.new("David", "TA", 10000)
