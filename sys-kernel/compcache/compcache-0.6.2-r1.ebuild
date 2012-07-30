# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils linux-mod toolchain-funcs

DESCRIPTION="Compressed RAM as fast swap"
HOMEPAGE="http://compcache.googlecode.com/"
SRC_URI="http://compcache.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~arm ~amd64 ~x86"
IUSE="swap_free_notify"

DEPEND=">=virtual/linux-sources-2.6"
RDEPEND="${DEPEND}"

pkg_setup() {
	if kernel_is -le 2 6 32; then
		BUILD_PARAMS='KV_OUT_DIR="${KV_OUT_DIR}"'
		BUILD_TARGETS="all"
		CONFIG_CHECK="LZO_COMPRESS LZO_DECOMPRESS SWAP"
		MODULE_NAMES="ramzswap(compcache:${S}:${S})"
		MODULESD_RAMZSWAP_DOCS="Changelog README load_modules.sh unload_modules.sh"
		MODULESD_RAMZSWAP_EXAMPLES=('ramzswap num_devices=1')
		linux-mod_pkg_setup
	else
		CONFIG_CHECK="~RAMZSWAP"
		linux-info_pkg_setup
	fi
}

src_prepare() {
	find . -name Makefile -exec sed -i \
		-e 's:make:$(MAKE):g' \
		-e "s:@gcc:$(tc-getCC):g" \
		-e 's#/lib/modules/$(shell uname -r)/build#"$(KV_OUT_DIR)"#' \
		{} \; || die

	cd "${S}"
	use swap_free_notify && epatch "${FILESDIR}"/${P}-free_notify.patch
}

src_compile() {
	if kernel_is -le 2 6 32; then
		linux-mod_src_compile
	else
		emake -C sub-projects/rzscontrol || die
	fi
}

src_install() {
	if kernel_is -le 2 6 32; then
		linux-mod_src_install
	fi

	dosbin sub-projects/rzscontrol/rzscontrol || die
	doman sub-projects/rzscontrol/man/rzscontrol.1 || die
	dohtml sub-projects/rzscontrol/man/rzscontrol.html || die

	newinitd "${FILESDIR}/init.d-${PN}" ${PN} || die
	newconfd "${FILESDIR}/conf.d-${PN}" ${PN} || die

	dodoc Changelog README || die
	dodoc patches/patch_swap_notify_core_support_2.6.33.diff || die
}
