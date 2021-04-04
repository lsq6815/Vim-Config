CXX:=g++
OPTIONS:=-lsfml-graphics -lsfml-window -lsfml-system -lsfml-network -lsfml-audio
TARGET:=app
OBJECT:=main.o
SOURCE:=main.cpp
RM:=rm -f

all: app

app: $(OBJECT)
	$(CXX) $(OBJECT) -o $(TARGET) $(OPTIONS)

obj: $(SOURCE)
	$(CXX) -c $(SOURCE)

clean:
	$(RM) $(OBJECT) $(TARGET)


