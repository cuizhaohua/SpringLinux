cmd_output/usr/include/scsi/fc/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/scsi/fc output/usr/include/scsi/fc arm fc_els.h fc_fs.h fc_gs.h fc_ns.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/scsi/fc output/usr/include/scsi/fc arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/generated/scsi/fc output/usr/include/scsi/fc arm ; for F in ; do echo "\#include <asm-generic/$$F>" > output/usr/include/scsi/fc/$$F; done; touch output/usr/include/scsi/fc/.install
