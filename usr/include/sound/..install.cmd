cmd_output/usr/include/sound/.install := perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/sound output/usr/include/sound arm asequencer.h asound.h asound_fm.h compress_offload.h compress_params.h emu10k1.h hdsp.h hdspm.h sb16_csp.h sfnt_info.h; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/sound output/usr/include/sound arm ; perl scripts/headers_install.pl /root/Cubietruck-Debian/output/linux-sunxi/include/generated/sound output/usr/include/sound arm ; for F in ; do echo "\#include <asm-generic/$$F>" > output/usr/include/sound/$$F; done; touch output/usr/include/sound/.install