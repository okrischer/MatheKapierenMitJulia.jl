module Zahlentheorie

const RD = Dict(zip(['I', 'V', 'X', 'L', 'C', 'D', 'M'],
                    [1,   5,   10,  50,  100, 500, 1000]))

export add_naive, sub_naive, mul_naive, div_naive, rom2dec

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

function add_naive(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be non-negative"))
  end
  while b > 0
    a += 1
    b -= 1
  end
  a
end

function sub_naive(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be non-negative"))
  end
  while b > 0
    a -= 1
    b -= 1
  end
  a
end

function mul_naive(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be non-negative"))
  end
  p = 0
  while b > 0
    p += a
    b -= 1
  end
  p
end

function div_naive(a::Integer, b::Integer)
  if a < 0 || b < 0
    throw(DomainError((a, b), "both arguments must be non-negative"))
  end
  b == 0 && throw(DomainError(b, "division by 0 is not defined"))
  q = 0
  while a >= b
    a -= b
    q += 1
  end
  q
end

function rom2dec(rom::String)::Int
  dec = 0
  for i in eachindex(rom)
    curr = RD[rom[i]]
    i == lastindex(rom) && return dec + curr
    next = RD[rom[i+1]]
    curr < next ? dec -= curr : dec += curr
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