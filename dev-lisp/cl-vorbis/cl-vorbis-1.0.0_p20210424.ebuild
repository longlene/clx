# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d2f766a154ec6e2c18d6fdbea51f15c2b367548d"

DESCRIPTION="Bindings to stb_vorbis"
HOMEPAGE="https://github.com/Shirakumo/cl-vorbis"
SRC_URI="https://github.com/Shirakumo/cl-vorbis/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/static-vectors
	dev-lisp/documentation-utils
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/*.so
}
