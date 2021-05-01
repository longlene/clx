# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="482c14b52e38fb65b1e82c1e968b5caf28f2aa87"

DESCRIPTION="A multipart message stream"
HOMEPAGE="https://github.com/wemeetagain/multipart-stream"
SRC_URI="https://github.com/wemeetagain/multipart-stream/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clean-composite-stream
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
