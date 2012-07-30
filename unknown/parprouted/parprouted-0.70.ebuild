# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator toolchain-funcs

# weird versioning scheme
MR="$(get_version_component_range 2)"
MY_PV="${PV}"
if [ $((${MR} % 10)) -eq 0 ]; then
	MY_PV="$(get_version_component_range 1).$((${MR} / 10))"
fi

EAPI="0"
SLOT="0"
LICENSE="GPL-2"
SRC_URI="http://www.hazard.maks.net/${PN}/${PN}-${MY_PV}.tar.gz"
DESCRIPTION="daemon for transparent IP (Layer 3) proxy ARP bridging"
HOMEPAGE="http://www.hazard.maks.net/"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${MY_PV}"

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dosbin "parprouted" || die "install failed"
	doman "parprouted.8" || die "install failed"
}
