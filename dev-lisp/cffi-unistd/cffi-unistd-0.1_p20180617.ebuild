# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1e281583dbb646f69d0115542906be4749732f52"

DESCRIPTION="Common Lisp wrapper for unistd.h"
HOMEPAGE="https://github.com/cffi-posix/cffi-unistd"
SRC_URI="https://github.com/cffi-posix/cffi-unistd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
