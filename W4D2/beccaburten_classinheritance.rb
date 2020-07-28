#PARENT CLASS
class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary 
        @boss = boss  #boss is an instance of Manager class
    end

    def bonus(multiplier)
        self.salary * multiplier
    end



end

#CHILD CLASS
class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss=nil)
        super
        @employees = [ ]
    end

     
    def add_employees(*employees) #employees = an array of Employee instances
        @employees += employees
    end

    def bonus(multiplier) #OVERRIDE employee bonus structure implement bfsish
        all_subordinates = @employees.dup #add nested employees
        count = 0 #total salaries under this manager
        
        until all_subordinates.empty?
            emp = all_subordinates.shift
            all_subordinates += emp.employees if emp.is_a?(Manager)
            count += emp.salary
        end
        
        count * multiplier
    end 

end

#COMPANY TREE
ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
ned.add_employees(darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.add_employees(shawna)
darren.add_employees(david)

p shawna
p david

#CHECK BONUSES
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

# Psuedocode:
# counter = 0 + Becca + Rich + Kafele + Emp1, Emp2, Emp3 + 
# queue = we queue up employees, add to queue thru BFS
# pop off employees, add their salary to outside counter

    # multiplier * queue.inject(0) do |acc, emp| 
    #     if queue[0].employees #add employees to queue
        
    #         acc += emp.salary 
    # end