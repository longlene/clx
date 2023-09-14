# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c8e3466d0ffb638938168dd8800db10aa3f730d6"

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
