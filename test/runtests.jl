using MatheKapierenMitJulia
using Test

@testset "arithmetik.jl" begin
    @test Arithmetik.bauernregel(83, 57) == 83 * 57
    @test Arithmetik.bauernregel(BigInt(1183), Int(757)) == 1183 * 757
end
