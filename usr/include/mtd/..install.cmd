cmd_output/usr/include/mtd/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/mtd output/usr/include/mtd arm inftl-user.h mtd-abi.h mtd-user.h nftl-user.h ubi-user.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/mtd output/usr/include/mtd arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/generated/mtd output/usr/include/mtd arm ; for F in ; do echo "\#include <asm-generic/$$F>" > output/usr/include/mtd/$$F; done; touch output/usr/include/mtd/.install