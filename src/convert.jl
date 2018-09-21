export forwardmode, float32, float64, gpu32

Adapt.adapt_(::Type{<:Array{T}}, xs::Array) where T <: AbstractFloat = 
    isbits(xs) ? xs : convert(Array{T}, xs)

float32(m) = mapleaves(x -> Flux.adapt(Array{Float32}, x), m)

float64(m) = mapleaves(x -> Flux.adapt(Array{Float64}, x), m)

gpu32(m) = gpu(float32(m))

forwardmode(m) = mapleaves(Flux.data, m)