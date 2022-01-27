void writeHeader(std::ofstream &image, int height, int width);
void writeDBI(std::ofstream &image, int height, int width, int dpi);
char getByte(int value, int byte);
int dpiToPPM(int dpi);
void writePixels(std::ofstream &image, unsigned char* red, unsigned char* green,
unsigned char* blue, int pixels);