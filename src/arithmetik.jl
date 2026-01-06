"""
Das Modul `Arithmetik` enthält Funktionen zum Rechnen mit ganzen Zahlen.
"""
module Arithmetik

export bauernregel

"""
    bauernregel(x, y)

*Russische Bauernregel* der Multiplikation für zwei natürliche Zahlen `x` und `y`.
Bei diesem Verfahren müssen wir nur halbieren, verdoppeln und addieren.
Die Berechnung wird implizit im *Binärsystem* durchgeführt.
"""
function bauernregel(x::Integer, y::Integer)::Integer
  z::Integer = 0
  while y > 0
    isodd(y) && (z += x)
    x <<= 1
    y >>= 1
  end
  z
end

end