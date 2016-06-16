defmodule Customer do

  defstruct name: "", company: ""

end


defmodule BugReport do

  defstruct severity: 1, customer: %Customer{}, details: ""

end

# r1 = %BugReport{severity: 2, customer: %Customer{name: "Dave", company: "PragBook"}, details: "first bug"}
# r1.customer.name

# r2 = %BugReport{ r1 | customer: %Customer{ r1.customer | name: "Peter"}}
# =
# put_in(r1.customer.company, "PragBookShelf")
# update_in(r1.severity, &(&1 + 1))
