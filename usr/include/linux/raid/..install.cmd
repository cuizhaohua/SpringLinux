cmd_output/usr/include/linux/raid/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/linux/raid output/usr/include/linux/raid arm md_p.h md_u.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/linux/raid output/usr/include/linux/raid arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/generated/linux/raid output/usr/include/linux/raid arm ; for F in ; do echo "\#include <asm-generic/$$F>" > output/usr/include/linux/raid/$$F; done; touch output/usr/include/linux/raid/.install