# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e81c80094f77edc9aac68328a35cec65fd69140b"

DESCRIPTION="Common Lisp wrappers for dirent.h"
HOMEPAGE="https://github.com/cffi-posix/cffi-dirent"
SRC_URI="https://github.com/cffi-posix/cffi-dirent/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
