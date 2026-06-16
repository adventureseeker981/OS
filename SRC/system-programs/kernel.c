#include "../Headers/ports.h"
#include "../Headers/kernel.h"
#include "../Headers/shell.h"
#include "../Headers/STDLIB/String.h"


extern void kernel_main(){
    shell_init();
    shell_run();
}