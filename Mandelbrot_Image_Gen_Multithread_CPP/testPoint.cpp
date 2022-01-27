#include <iostream>
#include <complex>
#include "testPoint.h"

//Compute the Z function
//This code adapted from W2L1 examples 
int z(long double x, long double y){
    //Create Values 
    std::complex<long double> c(x,y);
    std::complex<long double> current(0,0);

    //Run Iteratively
    for (int i = 1; i < 100; i++){
        current = current*current+c;
        if (std::abs(current) > 4)
            return i;
    }

    return 100;
}