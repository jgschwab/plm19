all: eg1

define hi
  echo "\n### $@ ######################\n"
endef

some=cut -d, -f 4,5,8,9 | sort -t, -n -k 4  | sed 's/,/,	/g'

Auto=cat $(Test)/data/auto.csv
Auto10=cat $(Test)/data/auto10000.csv
Auto1M=cat $(Test)/data/auto1M.csv
Weather=cat $(Test)/data/auto.csv
DSL= dsl/monte_carlo -n 2000 -s 1729 -v False| dsl/brooks2
# Redefine dom to use our new implementation
DOM = python3 ./dom

ok:; @bash $(Etc)/lua2bin

eg20:  ok; @$(hi); $(DSL) 
eg0:  ok; @$(hi); $(DSL) | $(DOM) | bestrest | super | rank
eg0a: ok; @$(hi); $(DSL) | $(DOM) | bestrest | super
eg0b: ok; @$(hi); $(DSL) 
eg1:  ok; @$(hi); cat $(Test)/data/weather.csv | $(DOM)
eg2:  ok; @$(hi); $(Auto) | $(DOM) | $(some); $(Auto) | head -1 | $(some)
eg2t: ok; @$(hi); $(Auto)
eg2a: ok; @$(hi); $(Auto) | $(DOM)
eg3:  ok; @$(hi); $(Auto) | $(DOM) | bestrest
eg4:  ok; @$(hi); $(Auto) | $(DOM) | bestrest | super
eg5:  ok; @$(hi); $(Auto) | $(DOM) | bestrest | super | rank
eg6:  ok; @$(hi); $(Auto10) | $(DOM) | bestrest | super | rank
eg6a: ok; @$(hi); $(Auto10) | $(DOM)
eg7:  ok; @$(hi); $(Auto1M) | $(DOM) | bestrest | super | rank

eg10:
	@$(MAKE) eg2a |  ./2d  weightSorted 4 weight 4
	@$(MAKE) eg2a |  ./2d  accelSorted 5 accel 5
	@$(MAKE) eg2a |  ./2d  domSorted 9 dom 9
	@$(MAKE) eg2a |  ./2d  mpgSorted 8 mpg 8
	@$(MAKE) eg2a |  ./2d  displacement 2 dom 9
	@$(MAKE) eg2a |  ./2d  horsepower 3 dom 9
