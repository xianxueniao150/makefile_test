# 默认指定为guess
PLAT := guess

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
DEPS := $(SRCS:.c=.d)

PROG := edit
CC := gcc -std=c99
CFLAGS := -Wall -O2
LDFLAGS :=
LIBS := -lm

# 第一个目标，也是默认会执行的目标
default: $(PLAT)

# 自动获得平台名，然后重新调用make程序
guess:
	@echo Guessing $(shell uname)
	@$(MAKE) $(shell uname)

$(PROG) : $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

# 特定于平台的变量
linux Linux: CFLAGS += -DUSE_LINUX
macosx Darwin: CFLAGS += -DUSE_MACOSX
macosx Darwin: LIBS += -ldl

# 重新调用make，通过命令行指定变量
linux macosx Linux Darwin:
	$(MAKE) $(PROG) CFLAGS="$(CFLAGS)" LIBS="$(LIBS)"

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),help)
-include $(DEPS)
endif
endif

%.d: %.c
	@echo "make depend: $@"
	@set -e; rm -f $@; \
	$(CC) $(CFLAGS) -MM $< | sed -E 's,($*).o[: ]*,\1.o $@: ,g' > $@

# 输出帮助
PLATS := linux macosx Linux Darwin
help:
	@echo "Do 'make PLATFORM' where PLATFORM is one of these:"
	@echo "   $(PLATS)"

clean :
	rm -f $(PROG) $(OBJS) $(DEPS)

.PHONY : default guess clean $(PLATS)