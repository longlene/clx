# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils java-vm-2 user vcs-snapshot

MY_PN="jadx"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Dex to Java decompiler"
HOMEPAGE="https://github.com/skylot/jadx"
SRC_URI="https://github.com/skylot/jadx/releases/download/v${PV}/${MY_P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="
	>=virtual/jre-1.8.0
"

S=${WORKDIR}
INSTALL_DIR=/opt/${MY_P}

src_install() {
	# install dir
	dodir ${INSTALL_DIR}
	mv "${S}"/lib "${D}${INSTALL_DIR}" || die "install failed"
	insinto ${INSTALL_DIR}/bin
	doins bin/{jadx,jadx-gui}
	dosym ${INSTALL_DIR}/bin/jadx /usr/bin/jadx
	dosym ${INSTALL_DIR}/bin/jadx-gui /usr/bin/jadx-gui
}

