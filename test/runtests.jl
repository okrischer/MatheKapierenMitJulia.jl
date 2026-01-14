using MatheKapierenMitJulia
using Test

@testset "Zahlentheorie - natürliche Zahlen" begin
    n, a = Zahlentheorie.count_up(['a', 'a', 'a', 'a'], ['b', 'b', 'b'])
    @test n == 7
    @test a == ['a', 'a', 'a', 'a', 'b', 'b', 'b']

    @test Zahlentheorie.nat_add(4, 3) == 7
    @test Zahlentheorie.nat_add(4, 0) == 4
    @test Zahlentheorie.nat_add(0, 3) == 3

    @test Zahlentheorie.nat_sub(4, 3) == 1
    @test Zahlentheorie.nat_sub(4, 4) == 0
    @test Zahlentheorie.nat_sub(3, 4) == 0

    @test Zahlentheorie.nat_mul(4, 3) == 12
    @test Zahlentheorie.nat_mul(3, 0) == 0
    @test Zahlentheorie.nat_mul(0, 3) == 0

    @test Zahlentheorie.nat_div(12, 3) == 4

    @test Zahlentheorie.roman2decimal("L") == 50
    @test Zahlentheorie.roman2decimal("LXVI") == 66
    @test Zahlentheorie.roman2decimal("XLVI") == 46
    @test Zahlentheorie.roman2decimal("MCMLXXXIV") == 1984

    @test Zahlentheorie.bauernregel(83, 57) == 83 * 57
    @test Zahlentheorie.bauernregel(BigInt(1183), Int(757)) == 1183 * 757
end
