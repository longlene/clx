# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="81ae9813df0f3eea7d5cb02a19b9f82270006fdb"

DESCRIPTION="Bindings to libfond, a simple text rendering engine for OpenGL"
HOMEPAGE="https://github.com/Shirakumo/cl-fond"
SRC_URI="https://github.com/Shirakumo/cl-fond/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/documentation-utils
	dev-lisp/cl-opengl
"
# libfond

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static/lin64-libfond.so
}
