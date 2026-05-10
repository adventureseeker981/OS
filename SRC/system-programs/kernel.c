
/** ** MODIFIED: Cleaned up includes - removed duplicates and old vgaColors.h reference ** **/
#include "../Headers/ports.h"
#include "../Headers/shell.h"


extern void kernel_main(){
    shell_init();
    shell_run();
}