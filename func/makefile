SRCS := $(wildcard *.c) # 使用内置函数自动匹配源文件
OBJS := $(SRCS:.c=.o)   # 将源文件转成目标文件
bar := $(SRCS:%.c=dir/%.c)
PLAT := $(shell uname)  # 调用shell函数，执行shell命令，得到系统名

default:
	@echo $(SRCS)
	@echo $(OBJS)
	@echo $(bar)
	@echo $(PLAT)