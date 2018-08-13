using Clustering
using Test

# load the examples array
include("hclust-generated-examples.jl")

# test to make sure many random examples match R's implementation
for example in examples
    h = hclust(example["D"], example["method"])
    for i in 1:size(h.merge)[2]
        for j in 1:size(h.merge)[1]
            @test h.merge[j,i] == example["merge"][j,i]
        end
    end
    @test h.height ≈ example["height"] atol=1e-5
    for i in 1:length(h.order)
        @test h.order[i] == example["order"][i]
    end
end
