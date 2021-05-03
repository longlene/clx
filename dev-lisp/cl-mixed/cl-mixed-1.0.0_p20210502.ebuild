# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="12ccaa7f3e2b2c3c337cd026506df8c55b011de4"

DESCRIPTION="A simple audio mixing and processing library based on libmixed"
HOMEPAGE="https://github.com/Shirakumo/cl-mixed"
SRC_URI="https://github.com/Shirakumo/cl-mixed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
"
#media-libs/libmixed

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/lin64-libmixed.so
}
