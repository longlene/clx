# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c4b9bd9a576d27f0ef3a6284973bd546567cf187"

DESCRIPTION="Lisp CFFI bindings for IM"
HOMEPAGE="https://github.com/lispnik/im"
SRC_URI="https://github.com/lispnik/im/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/im
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/static-vectors
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.txt
}
