cmd_output/usr/include/linux/byteorder/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/linux/byteorder output/usr/include/linux/byteorder arm big_endian.h little_endian.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/linux/byteorder output/usr/include/linux/byteorder arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/generated/linux/byteorder output/usr/include/linux/byteorder arm ; for F in ; do echo "\#include <asm-generic/$$F>" > output/usr/include/linux/byteorder/$$F; done; touch output/usr/include/linux/byteorder/.install
