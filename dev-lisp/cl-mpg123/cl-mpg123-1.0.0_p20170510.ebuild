# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c1cdec8518650ce6460c37ac7c6d2860af116a92"

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
	eapply_user
	use example || rm -rf example.lisp ${PN}-example.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/lin64-libmpg123.so
}
