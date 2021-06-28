module test_transientsol
using VoronoiFVM
using Test
function make_transientsol(;n=10,M=5,N=100,in_memory=true)
    makevec(k)=[ k+i*j for i=1:M,j=1:N]
    sol=TransientSolution(0,makevec(0),in_memory=in_memory)
    for k=1:n
        append!(sol,k,makevec(k))
    end
    sol
end

function test()
    msol=make_transientsol(in_memory=true)
    dsol=make_transientsol(in_memory=false)
    @test msol==dsol
    @test length(msol[2,:,1])==100
    @test length(dsol[2,:,2])==100
    trues
end

end
