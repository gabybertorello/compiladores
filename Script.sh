#! /bin/bash
echo "Compilando ..."

if jflex ./src/ctdsCompiler/Lexer.flex
then
  echo "Creacion del flex"
else 
  echo "Creacion del flex fallida"
  exit
fi


if java -jar ./lib/java-cup-11b.jar ./src/ctdsCompiler/Parser.cup
then
  echo "Creacion del parser.java y sym.java"
else 
  echo "Creacion del parser.java y sym.java"
  exit
fi

#mueve parser.java y sym.java a la carpeta ctdsCompiler
mv parser.java src/ctdsCompiler/
mv sym.java src/ctdsCompiler/
cd src

if javac -cp ../lib/cup/java-cup-11b.jar ./ctdsCompiler/sym.java
then
  echo "Creacion del sym.class"
else 
  echo "Creacion del sym.class fallida"
  exit
fi

if javac -cp .:../lib/java-cup-11b-runtime.jar ./ctdsCompiler/parser.java
then
  echo "Creacion del Parser.class"
else 
  echo "Creacion del Parser.class fallida"
  exit
fi

if javac -cp .:../lib/java-cup-11b-runtime.jar ./ctdsCompiler/Lexer.java
then
  echo "Creacion del Lexer.class"
else 
  echo "Creacion del Lexer.class fallida"
  exit
fi

if javac -cp .:../lib/java-cup-11b-runtime.jar ./ctdsCompiler/Main.java
then
  echo "Creacion del Main.class"
else 
  echo "Creacion del Main.class fallida"
  exit
fi

echo "Introduzca el test que desea probar"
read test
java -cp .:../lib/java-cup-11b-runtime.jar ctdsCompiler/Main $test
