# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="93bb339de3348ad211914f9b5aeb4c296f79477e"

DESCRIPTION="CFFI bindings to FUSE (Filesystem in user space)"
HOMEPAGE="https://github.com/fb08af68/cl-fuse/"
SRC_URI="https://github.com/fb08af68/cl-fuse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
