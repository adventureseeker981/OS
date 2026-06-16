#include "../Headers/kernel.h"
#include "../Headers/shell.h"
#include "../Headers/vga.h"
#include "../Headers/filesystem.h"


void ReadFile(File file) {
    printClr(file.data, COLOR_WHITE);
}

void EditFile(File file, unsigned char *input, unsigned int append, unsigned int size) {
    if (append) {
        unsigned int i = 0;
        while(input[i] != '\0') {
            file.data[i+size] = input[i];
            i++;
        }
        file.data[i+size] = '\0';
    }
    else{
        unsigned int i = 0;
        while(input[i] != '\0') {
            file.data[i] = input[i];
            i++;
        }
        file.data[i] = '\0';
    } 
}