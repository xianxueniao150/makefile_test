foo = hello 
bar := $(foo)
foo += world # foo追加值

default:
	@echo $(bar)