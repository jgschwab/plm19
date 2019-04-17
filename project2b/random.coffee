#!/usr/bin/env coffee
# Middle square method with Weyl sequence
# https://en.wikipedia.org/wiki/Middle-square_method#Middle_Square_Weyl_Sequence_PRNG
# https://pthree.org/2018/07/30/middle-square-weyl-sequence-prng/

n = 100
# Default seed is last 4 digits of unix time
seed = Number(String((new Date).getTime()).substr(8)) & 0xffff
console.log seed.toString(16)

# Parse arguments -n and -s
i = 0
for arg in process.argv
    if arg == "-n"
        n = Number(process.argv[i + 1])
    if arg == "-s"
        seed = Number(process.argv[i + 1])
    i++


# Pipeline stages for number generation
multiply = (params) ->
    params.x *= params.x
    params

add = (params) ->
    params.weyl += params.seed
    params.x += params.weyl
    params

middle = (params) ->
    params.x = params.x >>> 8 & 0xffff
    params


normalize = (params) ->
    params.result = params.x / (Math.pow(2, 16) - 1)
    params


# Top level, call all stages of the pipeline
random = (params) ->
    normalize middle add multiply params



# Data object for passing through the pipe
params = { x: 0, weyl: 0, seed: seed, result: 0 }


# Print out n "random" numbers
for _ in [1..n]
    params = random params
    console.log params.result
