module Zahlentheorie

const RD = Dict(zip(['I', 'V', 'X', 'L', 'C', 'D', 'M'],
                    [1,   5,   10,  50,  100, 500, 1000]))

export nat_add, nat_sub, nat_mul, nat_div, roman2decimal

function count(collection::AbstractVector)
  n = 0
  for _ in collection
    n += 1
  end
  n
end

function count_up(a::AbstractVector, b::AbstractVector)
  n = count(a)
  while !isempty(b)
    push!(a, pop!(b))
    n += 1
  end
  (n, a)
end

function nat_add(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be natural numbers"))
  end
  while b > 0
    a += 1
    b -= 1
  end
  a
end

function nat_sub(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be natural numbers"))
  end
  while a > 0 && b > 0
    a -= 1
    b -= 1
  end
  a
end

function nat_mul(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be natural numbers"))
  end
  p = 0
  while a > 0
    p = nat_add(p, b)
    a -= 1
  end
  p
end

function nat_div(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be natural numbers"))
  end
  b == 0 && throw(DomainError(b, "division by 0 is not defined"))
  q = 0
  while a >= b
    a = nat_sub(a, b)
    q += 1
  end
  q
end

function roman2decimal(roman::String)::Int
  decimal = 0
  for i in eachindex(roman)
    current = RD[roman[i]]
    i == lastindex(roman) && return decimal + current
    next = RD[roman[i+1]]
    current < next ? decimal -= current : decimal += current
  end
end

function bauernregel(x::Integer, y::Integer)
  z = 0
  while y > 0
    isodd(y) && (z += x)
    x <<= 1
    y >>= 1
  end
  z
end

end