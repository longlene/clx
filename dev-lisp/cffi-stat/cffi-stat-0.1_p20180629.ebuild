# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6bbeced97cdb1047584ad41a08c127c144e0e72d"

DESCRIPTION="Common Lisp wrapper for stat.h"
HOMEPAGE="https://github.com/cffi-posix/cffi-stat"
SRC_URI="https://github.com/cffi-posix/cffi-stat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
