cmd_output/usr/include/asm/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/arch/arm/include/asm output/usr/include/asm arm a.out.h byteorder.h fcntl.h hwcap.h ioctls.h ipcbuf.h mman.h msgbuf.h param.h posix_types.h ptrace.h sembuf.h setup.h shmbuf.h sigcontext.h signal.h socket.h sockios.h stat.h statfs.h swab.h termbits.h termios.h types.h unistd.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/arch/arm/include/asm output/usr/include/asm arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/arch/arm/include/generated/asm output/usr/include/asm arm ; for F in auxvec.h bitsperlong.h errno.h ioctl.h poll.h resource.h siginfo.h; do echo "\#include <asm-generic/$$F>" > output/usr/include/asm/$$F; done; touch output/usr/include/asm/.install
