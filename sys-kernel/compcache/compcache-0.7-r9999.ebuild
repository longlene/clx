# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils linux-mod toolchain-funcs mercurial

DESCRIPTION="Compressed RAM as fast swap"
HOMEPAGE="http://compcache.googlecode.com/"
#SRC_URI="http://compcache.googlecode.com/files/${P}.tar.gz"
EHG_REPO_URI="https://compcache.googlecode.com/hg/"
S="${WORKDIR}/compcache"

LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~arm ~amd64 ~x86"
IUSE="swap_free_notify"

DEPEND=">=virtual/linux-sources-2.6 
		dev-vcs/mercurial
		"
RDEPEND="${DEPEND}"

pkg_setup() {
		BUILD_PARAMS='KV_OUT_DIR="${KV_OUT_DIR}"'
		BUILD_TARGETS="all"
		CONFIG_CHECK="LZO_COMPRESS LZO_DECOMPRESS SWAP !RAMZSWAP"
		MODULE_NAMES="zram(compcache:${S}:${S})"
		MODULESD_ZRAM_DOCS="Changelog README"
		MODULESD_ZRAM_EXAMPLES=('zram num_devices=1')
		linux-mod_pkg_setup
}

src_prepare() {
	find . -name Makefile -exec sed -i \
		-e 's:make:$(MAKE):g' \
		-e "s:@gcc:$(tc-getCC) :g" \
		-e 's#/lib/modules/$(shell uname -r)/build#"$(KV_OUT_DIR)"#' \
		{} \; || die

	cd "${S}"
	use swap_free_notify && epatch "${FILESDIR}"/${P}-free_notify.patch
}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	dosbin sub-projects/scripts/zram_stats || die

	newinitd "${FILESDIR}/init.d-${PN}" ${PN} || die
	newconfd "${FILESDIR}/conf.d-${PN}" ${PN} || die

	dodoc Changelog README || die
	dodoc patches/patch_swap_notify_core_support_2.6.33.diff || die
}
