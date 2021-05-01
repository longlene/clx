# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d78c880f65f2e2d0fa15427b6778ed68433fd41b"

DESCRIPTION="WITH- group with- macros, allocate objects and rebind slots"
HOMEPAGE="https://github.com/stacksmith/cl-with"
SRC_URI="https://github.com/stacksmith/cl-with/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/closer-mop
"
BDEPEND=""
