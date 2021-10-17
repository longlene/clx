# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils

DESCRIPTION="note taking web app"
HOMEPAGE="https://laverna.cc/"
SRC_URI="
	amd64? ( https://github.com/Laverna/laverna/releases/download/${PV}/laverna-${PV}-linux-x64.zip )
	x86? ( https://github.com/Laverna/laverna/releases/download/${PV}/laverna-${PV}-linux-ia32.zip )
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="strip"

S="${WORKDIR}"

src_install() {
	insinto /opt/${PN}
	doins -r *
	make_wrapper "${PN}" "/opt/${PN}/laverna"
	make_desktop_entry "${PN}" "Note Taking Web App" "${PN}" "Utility"
	doicon resources/app/dist/images/icon/icon.png
	fperms +x "/opt/${PN}/laverna"
	fperms +x "/opt/${PN}/libnode.so"
	fperms +x "/opt/${PN}/libffmpeg.so"
}
