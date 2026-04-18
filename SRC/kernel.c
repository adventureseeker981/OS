void printstr(const char *string)
{
	char *str = string, *ch;
	unsigned short *vidmem = (unsigned short*) 0xb8000;
	unsigned i;
	
	for (ch = str, i = 0; *ch; ch++, i++)
		vidmem[i] = (unsigned char) *ch | 0x0f00;
}


extern void kernel_main(){
    char *str = "Radhe Radhe";
    printstr(str);
    return;
}