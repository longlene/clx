# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="An open-source alternative to Claude Cowork, powered by OpenCode"
HOMEPAGE="
	https://openwork.software/
	https://github.com/different-ai/openwork
"
SRC_URI="https://github.com/different-ai/openwork/releases/download/v0.2.4/OpenWork_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-util/opencode
	net-libs/webkit-gtk:4.1
"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="
	/usr/bin/openwork
"

src_install() {
	rm usr/bin/opencode
	mv "${S}"/* "${ED}" || die
}
