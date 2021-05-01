# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="41ae45aac86553c46f4bb460f80e1fb620930f5b"

DESCRIPTION="Comon Lisp bindings for the Cairo API"
HOMEPAGE="http://cliki.net/cl-cairo2"
SRC_URI="https://github.com/rpav/cl-cairo2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

RDEPEND="
	dev-lisp/cffi
	dev-lisp/cl-utilities
	dev-lisp/cl-colors
	dev-lisp/metabang-bind
	dev-lisp/trivial-garbage
	dev-lisp/trivial-features
	>=x11-libs/cairo-1.6
	dev-lisp/cl-freetype2
	dev-lisp/cl-xcb-xlib
	dev-lisp/cl-gtk2-cairo
"

src_prepare() {
	eapply_user
	rm -r a-cl-cairo2-loader.asd \
		cl-cairo2-win32.asd src/win32 \
		cl-cairo2-quartz.asd src/quartz
	use example || rm -r cl-cairo2-demos.asd demos
}

src_install() {
	common-lisp-3_src_install
	docinto tutorial && dodoc tutorial/*.{lisp,pdf}
}
