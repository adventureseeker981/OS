#include "../../Headers/STDLIB/String.h"

typedef char *String;

unsigned int len(const char *s){
    unsigned int length = 0;
    while(s[length] != "\0"){
        length++;
    }
    return length;
}