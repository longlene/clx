# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9447d3e645e7ff34e1d92c664c4ac8aea65998bc"

DESCRIPTION="Common Lisp CFFI wrapper around a LZMA foreign library"
HOMEPAGE="https://github.com/phoe/cl-lzma/"
SRC_URI="https://github.com/phoe/cl-lzma/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-arch/lzma
	dev-lisp/cl-autowrap
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all bin spec
}
