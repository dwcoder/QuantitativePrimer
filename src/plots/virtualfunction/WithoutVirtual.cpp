#include <iostream>

using namespace std;

class Car
{
public:
void emissions() const { cout << "I probably burn fuel." << "\n"; }
};

class ElectricCar : public Car
{
public:
void emissions() const { cout << "I have zero emissions!" << "\n"; }
};

void queryEmissionsForTax(Car const&  ccc) { ccc.emissions(); }

int main(int argc, char ** argv)
{
    Car car;
    ElectricCar tesla;

    car.emissions();
    tesla.emissions();

    queryEmissionsForTax(car);
    queryEmissionsForTax(tesla);

    return 0;
}
