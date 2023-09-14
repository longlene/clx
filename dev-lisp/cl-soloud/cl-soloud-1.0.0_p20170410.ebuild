# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4ba2b98d6241c62709f8bbec6f8ec6a12c6cb7ce"

DESCRIPTION="Bindings to SoLoud, a multi-platform, multi-backend, minimal dependencies sound mixing and output library"
HOMEPAGE="https://github.com/Shirakumo/cl-soloud"
SRC_URI="https://github.com/Shirakumo/cl-soloud/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/trivial-indent
	dev-lisp/documentation-utils
	media-sound/soloud
"

src_install() {
	common-lisp-3_src_install
	exeinto /usr/share/common-lisp/source/${PN}/static
	doexe static/lin64-libsoloud.so
}
