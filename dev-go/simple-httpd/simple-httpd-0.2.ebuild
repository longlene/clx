# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/briandowns/simple-httpd"

DESCRIPTION="Simple HTTP server is a replacement for Python SimpleHTTPServer"
HOMEPAGE="https://github.com/briandowns/simple-httpd"
SRC_URI="https://github.com/briandowns/simple-httpd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin simple-httpd
	dodoc src/${EGO_PN}/README.md
}
