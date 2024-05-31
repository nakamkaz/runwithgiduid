#include <fcntl.h>
#include <stdlib.h>
int main(void){
  int fd;
  /* write with uid into rootarea 770 root:root  */
  fd = creat("./rootarea/uidtest1", 0644);
  return 0;
}
