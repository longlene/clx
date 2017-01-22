# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ad126c6b12ba15669f55a315d98a040d4b829483"

DESCRIPTION="Common Lisp string manipulation library"
HOMEPAGE="https://github.com/vindarel/cl-str"
SRC_URI="https://github.com/vindarel/cl-str/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/prove
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all READMD.md
}
