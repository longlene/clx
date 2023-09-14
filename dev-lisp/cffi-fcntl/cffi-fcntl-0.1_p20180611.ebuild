# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b53f2471ea449d8cec3a0262f1595b045271ca9"

DESCRIPTION="Common Lisp wrapper for fcntl.h"
HOMEPAGE="https://github.com/cffi-posix/cffi-fcntl"
SRC_URI="https://github.com/cffi-posix/cffi-fcntl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cffi-errno
"
BDEPEND=""
