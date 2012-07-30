inherit linux-mod

DESCRIPTION="filesystem driver for the rio karma."
HOMEPAGE="http://linux-karma.sourceforge.net/"
SRC_URI="mirror://sourceforge/linux-karma/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT=""
DEPEND=""
RDEPEND=""

MODULE_NAMES="omfs(extra:)"
BUILD_TARGETS="default"
CONFIG_CHECK="KARMA_PARTITION USB_STORAGE"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
}

src_unpack() {
	unpack ${A}
	convert_to_m ${S}/Makefile
	cd "${S}"
}

src_install() {
	dodoc ChangeLog README
	linux-mod_src_install
}
