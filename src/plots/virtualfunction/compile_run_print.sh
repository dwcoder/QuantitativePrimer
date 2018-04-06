#!/bin/bash

echo "Compiling"
g++ WithoutVirtual.cpp -o WithoutVirtual.cpp.out
g++ WithVirtual.cpp -o WithVirtual.cpp.out

echo "Running..."
./WithoutVirtual.cpp.out > WithoutVirtual.txt
./WithVirtual.cpp.out > WithVirtual.txt

echo "Results"
echo "Without virtual":
cat WithoutVirtual.txt

echo "With virtual":
cat WithVirtual.txt


