static unsigned short *vidmem = (unsigned short*) 0xb8000;
static unsigned int cursor = 0;

void printstr(char *string){
	for (char*ch = string; *ch; ch++){
		if (*ch == '\n'){
			cursor = (cursor / 80+1) * 80;
			continue;
		}
		vidmem[cursor++] = (unsigned char) *ch | 0x0e00;
	}
}

extern void kernel_main(){
    char *str = "Radhe Radhe \nVinu";
    printstr(str);
    return;
}