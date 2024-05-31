#include <fcntl.h>
#include <stdlib.h>
int main(void){
  int fd;
  /* create file into rootarea root:root 755  */
  fd = creat("./rootarea/gidtest1", 0644);
  return 0;
}
