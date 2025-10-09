# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Firefox Reader View as a command line tool"
HOMEPAGE="https://github.com/eafer/rdrview"
SRC_URI="https://github.com/eafer/rdrview/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libxml2
	net-misc/curl
	sys-libs/libseccomp
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin rdrview
	doman rdrview.1
	einstalldocs
}
