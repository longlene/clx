# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e5b18d2686d2aae4f7d40c9e40748ce69e60127"

DESCRIPTION="Email for humans"
HOMEPAGE="https://github.com/eudoxia0/postmaster"
SRC_URI="https://github.com/eudoxia0/postmaster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mel-base
	dev-lisp/cl-smtp
	dev-lisp/trivial-types
	dev-lisp/trivial-mimes
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
