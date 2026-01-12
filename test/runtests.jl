using MatheKapierenMitJulia
using Test

@testset "Zahlentheorie - natürliche Zahlen" begin
    n, a = Zahlentheorie.count_up(['a', 'a', 'a', 'a'], ['b', 'b', 'b'])
    @test n == 7
    @test a == ['a', 'a', 'a', 'a', 'b', 'b', 'b']

    @test Zahlentheorie.add_naive(4, 3) == 7
    @test Zahlentheorie.sub_naive(4, 3) == 1
    @test Zahlentheorie.mul_naive(4, 3) == 12
    @test Zahlentheorie.div_naive(12, 3) == 4

    @test Zahlentheorie.rom2dec("L") == 50
    @test Zahlentheorie.rom2dec("LXVI") == 66
    @test Zahlentheorie.rom2dec("XLVI") == 46
    @test Zahlentheorie.rom2dec("MCMLXXXIV") == 1984

    @test Zahlentheorie.bauernregel(83, 57) == 83 * 57
    @test Zahlentheorie.bauernregel(BigInt(1183), Int(757)) == 1183 * 757
end
