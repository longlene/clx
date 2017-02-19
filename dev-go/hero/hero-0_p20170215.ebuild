# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/shiyanhui/hero/..."
EGIT_COMMIT="919e183490ac1f6cd78bef8e77c7f3b76d5fbe79"

DESCRIPTION="A handy, fast and powerful go template engine"
HOMEPAGE="https://github.com/shiyanhui/hero"
SRC_URI="https://github.com/shiyanhui/hero/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/fsnotify
"

src_install() {
	golang-build_src_install
	dobin bin/hero
	dodoc src/${EGO_PN%/*}/README.md
}
RDEPEND="${DEPEND}"
