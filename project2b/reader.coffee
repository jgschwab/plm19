fs = require 'fs'
configFile = 'config'

read = () ->
    fs.readFileSync configFile, 'utf8'
    
config = read()    
console.log config
fields = []

class StateMachineReader
    constructor: (@input) ->
        @index = 0
        @state = "name"
        @name = ""
        @min = ""
        @max = ""
    
    next: ->
        switch @state
            when "name"
                if (@input.charAt @index) is ' '
                    @state = "min"
                else
                    @name += @input.charAt @index
                @index += 1
                return 0
            when "min"
                if (@input.charAt @index) is ' '
                    @state = "max"
                    @min = parseFloat(@min, 10)
                else
                    @min += @input.charAt @index
                @index += 1
                return 0
            when "max"
                if (@input.charAt @index) is '\n'
                    @state = "rowEnd"
                    @max = parseFloat(@max, 10)
                else
                    @max += @input.charAt @index
                @index += 1
                return 0
            when "rowEnd"
                if @index is @input.length
                    @state = "done"
                else
                    @state = "name"
                    fields.push {name: @name, min: @min, max: @max}
                    @name = ""
                    @min = ""
                    @max = ""
                return 0  
reader = new StateMachineReader config

reader.next() until reader.state is "done"
#console.log fields

gen = Singleton.get()


for field, i in fields
    process.stdout.write field.name
    (process.stdout.write) ", " if i < fields.length - 1
process.stdout.write "\n"


num = 10
for [0...num]
    for field, i in fields
        process.stdout.write gen.generate(field.min, field.max)
        (process.stdout.write) ", " if i < fields.length - 1
    process.stdout.write "\n"




class Singleton

  instance = null
  
  class Generator
    constructor: () ->
    
    @generate: (min, max) -> 
      
    
  @get: ()
    instance ?= new Generator()