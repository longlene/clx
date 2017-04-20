# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3540ced67e609a0ab1ba64759b4806bece2d9242"

DESCRIPTION="CFFI bindings to FUSE (Filesystem in user space)"
HOMEPAGE="https://github.com/ralt/cl-fuse/"
SRC_URI="https://github.com/ralt/cl-fuse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-utilities
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-backtrace
	dev-lisp/iterate
	dev-lisp/trivial-utf8
"
