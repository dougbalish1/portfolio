#include <iostream> //needed for printing error messages to cerr
#include <fstream> //needed to open image file for writing 
#include <string> //needed for filename 
#include <complex> //needed to compute if points in MB set (work with CX #s)
#include <thread> //needed to launch multiple threads
#include <vector> //vector used to store running threads
#include "bmpFuncs.h" //all bitmap creation related funcitons 
#include "testPoint.h" //function to test if a point in MB set

//Prints error message if CLA are supplied incorrectly 
void errMsg();
//Checks that CLA are correctly formatted and converts them to long doubles 
void getCheckArgs(char** argv, long double* x1, long double* x2, 
long double* y1, long double* y2, std::string* outFileName);
//Determines if point is in set or what border color should be used and sets pixel array 
void setColors(unsigned char* red, unsigned char* green, unsigned char* blue, int threadID,
int numThreads, int height, int width, long double x1, long double x2, long double y1,
long double y2);

int main(int argc, char** argv){
    long double x1, x2, y1, y2;
    int height;
    int pixels;
    int width = 1500;
    int num_threads = std::thread::hardware_concurrency();
    std::string outFileName;
    std::vector<std::thread> threads;

    //Prints error if bad number of CLA provided
    if (argc != 6)
        errMsg();

    //Make sure detected number of threads conforms to assignment 
    if (num_threads > 16 || num_threads < 4)
        num_threads = 4;

    getCheckArgs(argv, &x1, &x2, &y1, &y2, &outFileName);
    
    //Set height to scale based on relationship to x length and calculate # of pixels 
    height = ((y2-y1)/(x2-x1)) * 1500;
    pixels = height * width;
    
    //Set up arrays for pixel values
    unsigned char* red = new unsigned char[pixels];
	unsigned char* green = new unsigned char[pixels];
	unsigned char* blue = new unsigned char[pixels];

    //Spawn threads to work on setting pixel colors 
    for (int i = 0; i < num_threads; i++)
        threads.push_back(std::thread(setColors, red, green, blue, i, num_threads,
        height, width, x1, x2, y1, y2));
    
    //We can start writing header data before threads are finished 
    std::ofstream image(outFileName,std::ios::binary);
    writeHeader(image, height, width);
	writeDBI(image, height, width, 150);
    
    //Wait for threads to finish setting colors before writing image data
    for ( int i = 0; i < threads.size(); i++)
        threads[i].join();

    //Now that all pixel arrays are complete, write data to file 
    writePixels(image, red, green, blue, pixels);
    image.close();
    return 0;
}

void errMsg(){
    std::cerr << "Error: Bad input arguments supplied.\n";
    std::cerr << "Usage: mandelbrot [x_1] [x_2] [y_1] [y_2] [file to write]\n";
    std::cerr << "Where: x_1, x_2, y_1, y_2 are numeric, and filename is any string.\n";

    exit(1);
}

void getCheckArgs(char** argv, long double* x1, long double* x2, 
long double* y1, long double* y2, std::string* outFileName){
    for (int i = 1; i < 5; i++){
        char* endPTR;
        switch (i){
            case 1:
                *x1 = strtod(argv[i], &endPTR);
            case 2:
                *x2 = strtod(argv[i], &endPTR);
            case 3:
                *y1 = strtod(argv[i], &endPTR);
            case 4:
                *y2 = strtod(argv[i], &endPTR);
        }
        if (*endPTR != '\0')
            errMsg();
    }
    *outFileName = argv[5];
}

/*Realized too late I should have stuck with global variables for some of these
and now I must suffer the consequences */
void setColors(unsigned char* red, unsigned char* green, unsigned char* blue, int threadID,
int numThreads, int height, int width, long double x1, long double x2, long double y1,
long double y2){
    int i = threadID;
    double row, col;
    long double x_pos, y_pos;
    int color;

    while(i < (height * width)){
        //Calculate row and column of image 
        col = i%width;
        row = i/width;
        //Calculate what (x,y) point corresponds to current pixel position
        x_pos = x1 + ((x2-x1)*(col/width));
        y_pos = y1 + ((y2-y1)*(row/height));
        //Determine if it is in set or how many iterations 
        color = z(x_pos, y_pos);
        //If point is in set, color pure red
        if (color == 100){
            red[i] = 255;
            blue[i] = 0;
            green[i] = 0;
        } 
        //If point is not in set, use boundary gradient based on number iterations
        else {
            red[i] = 20;
            blue[i] = 40;
            green[i] = color*2;
        }
        i+=numThreads;
    }
}






