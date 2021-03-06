__precompile__(true)

module FluxUtils

using Printf, LinearAlgebra, Statistics, Distributed, Random
using Flux, BSON, ProgressMeter, Parameters, Requires

using Flux: glorot_uniform, gate, zeros, ones, stack, unsqueeze, chunk
using Flux: param, prefor, children, mapleaves, truncate!, loadparams!
using Flux: RNNCell, LSTMCell, GRUCell, Recur, OneHotMatrix, OneHotVector
import Flux: hidden, @treelike

using Flux.Tracker: TrackedArray, back!, grad, data, tracker, track, istracked, isleaf, IdSet, @grad
using Flux.Tracker: ∇broadcast, unbroadcast, Call, TrackedStyle, broadcast_rebuild

using Flux.Optimise: update!, apply!, train!, _update_params!
using Flux.Optimise: Optimiser, Params, WeightDecay, ϵ, runall, IdDict

include("math.jl")
include("batch.jl")
include("layer.jl")
include("recurrent.jl")
include("util.jl")
include("params.jl")
include("vector.jl")
include("sklearn.jl")
include("broadcast.jl")
include("train.jl")
include("optimizer.jl")
include("bmm.jl")
if isdefined(Flux, :CuArrays)
    include("cuda.jl")
end

function __init__()
    @require MPI="da04e1cc-30fd-572f-bb4f-1f8673147195" include("mpi.jl")
end

end
