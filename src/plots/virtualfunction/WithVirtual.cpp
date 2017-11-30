#include <iostream>

class Car
{
public:
virtual void emissions() { std::cout << "I probably burn fuel." << std::endl; }
};

class ElectricCar : public Car
{
public:
void emissions() { std::cout << "I have zero emissions!" << std::endl; }
};

void queryEmissionsForTax(Car *ccc) { ccc->emissions(); }

int main(int argc, char ** argv)
{
    Car * car = new Car;
    ElectricCar * tesla = new ElectricCar;

    car->emissions();
    tesla->emissions();

    queryEmissionsForTax(car);
    queryEmissionsForTax(tesla);

    return 1;
}
