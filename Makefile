CC 	   =gcc
CFLAGS =-Wextra -Wall -g
# CLIBS  =-I lib/*

BINDIR =bin
OBJDIR =obj
SRCDIR =src

SRC    =$(wildcard $(SRCDIR)/*.c)
OBJ    =$(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC))
BIN    =gman

all: $(BIN)

bindir:
	mkdir -p $(BINDIR)

objsdir:
	mkdir -p $(OBJDIR)

$(BIN): $(OBJ) bindir
	$(CC) $(CFLAGS) $(OBJ) $(CLIBS) -o $(BINDIR)/$(BIN)

$(OBJDIR)/%.o: $(SRCDIR)/%.c objsdir
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BINDIR)/* $(OBJDIR)/*

