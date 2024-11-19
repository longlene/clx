# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3557553f4a0989cfc1f74b9ce2592119c8800aae"

DESCRIPTION="Bindings to libmpg123, allowing fast MPG1/2/3 decoding"
HOMEPAGE="http://shirakumo.github.io/cl-mpg123/"
SRC_URI="https://github.com/Shirakumo/cl-mpg123/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/documentation-utils
"
#media-sound/mpg123

src_prepare() {
	default
	use example || rm -rf example.lisp ${PN}-example.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/lin64-libmpg123.so
}
