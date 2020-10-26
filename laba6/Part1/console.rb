# frozen_string_literal: true

require_relative 'main'

printf "\nResult of calculating"
eps1 = 10**-3
eps2 = 10**-4
printf "\nEps - #{eps1} -> Value - #{calc(eps1)}\n"
printf "Eps - #{eps2} -> Value - #{calc(eps2)}\n"

printf "\nResult of calculating with Enumerable"
printf "\nEps - #{eps1} -> Value - #{calc_enum(eps1)}\n"
printf "Eps - #{eps2} -> Value - #{calc_enum(eps2)}"
