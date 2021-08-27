# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1c046b44871ac806dd67cbac53ddc6bef4092bb3"

DESCRIPTION="A minimal set of CL bindings for XCB and FreeType"
HOMEPAGE="https://github.com/cl-fui/cl-xcb"
SRC_URI="https://github.com/cl-fui/cl-xcb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-freetype2
	x11-libs/libxcb
"
BDEPEND=""
