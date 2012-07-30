# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod toolchain-funcs flag-o-matic

MY_P="${P/_/-}" # for -preN versions
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Linux kernel module and interface providing file access control"
HOMEPAGE="http://www.dazuko.org"
SRC_URI="http://dazuko.dnsalias.org/files/${MY_P}.tar.gz"

SLOT="0"
LICENSE="GPL-2 BSD"
KEYWORDS="~amd64"
IUSE=""

DEPEND="=virtual/linux-sources-2.6.28*"
RDEPEND="${DEPEND}"

pkg_setup() {
	linux-mod_pkg_setup
	# kernel settings
	MODULE_NAMES="dazukofs(misc:)"
	BUILD_TARGETS="dazukofs_modules"
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -e "s:\$(DAZUKOFS_KERNEL_SRC):${KV_DIR}:" -i Makefile
}

src_compile() {
	set_arch_to_kernel
	convert_to_m Makefile
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	insinto /usr/include
	doins dazukofs_fs.h
#	doins event.h
#	doins dev.h

	dodoc README*
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

pkg_postrm() {
	linux-mod_pkg_postrm
}
