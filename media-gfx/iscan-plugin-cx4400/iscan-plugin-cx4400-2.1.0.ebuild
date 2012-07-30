# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit rpm

# Revision used by upstream
SRC_REV="1"

DESCRIPTION="Epson Stylus CX4300/CX4400/CX4450/CX5500/CX5600/DX4400/DX4450 scanner plugin for SANE 'epkowa' backend."
HOMEPAGE="http://www.avasys.jp/english/linux_e/dl_scan.html"
SRC_URI="
	x86? ( http://linux.avasys.jp/drivers/scanner-plugins/Epson_Stylus_CX4400/${P}-${SRC_REV}.i386.rpm )
	amd64? ( http://linux.avasys.jp/drivers/scanner-plugins/Epson_Stylus_CX4400/${P}-${SRC_REV}.x86_64.rpm )"

LICENSE="AVASYS"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""
IUSE_LINGUAS="ja"

for X in ${IUSE_LINGUAS}; do IUSE="${IUSE} linguas_${X}"; done

DEPEND=">=media-gfx/iscan-2.21.0"
RDEPEND="${DEPEND}"

src_install() {
	local MY_LIB="/usr/$(get_libdir)"

	## install scanner firmware
	#insinto /usr/lib/iscan
	#doins "${WORKDIR}/usr/lib/iscan/"*

	# install docs
	if use linguas_ja; then
		dodoc "usr/share/doc/${P}/AVASYSPL.ja.txt"
	 else
		dodoc "usr/share/doc/${P}/AVASYSPL.en.txt"
	fi

	# install scanner plugins
	insinto "${MY_LIB}/iscan"
	INSOPTIONS="-m0755"
	doins "${WORKDIR}/usr/$(get_libdir)/iscan/"*
}

pkg_postinst() {
	local MY_LIB="/usr/$(get_libdir)"

	# Needed for scaner to work properly.
	iscan-registry --add interpreter usb 0x04b8 0x083f "${MY_LIB}/iscan/libesint7E.so"
	elog
	elog "Firmware file esfw8b.bin for Epson Stylus CX4400/DX4400"
	elog "has been installed in /usr/share/esci and registered for use."
	elog
}

pkg_prerm() {
	local MY_LIB="/usr/$(get_libdir)"

	scan-registry --remove interpreter usb 0x04b8 0x083f "${MY_LIB}/iscan/iscan/libesint7E.so"
}
