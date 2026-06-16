
#ifndef FILESYSTEM_H
#define FILESYSTEM_H


typedef struct {
    unsigned int file_or_dir;
    unsigned char *name;
    unsigned char data[];
} File;

typedef struct {
    unsigned int file_count;
    unsigned char *current_dir;
    File files[20];
} FileSystem;

void EditFile(File file, unsigned char *input, unsigned int append, unsigned int size);
void ReadFile(File file) ;

#endif
