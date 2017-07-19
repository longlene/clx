# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c16f044c95eb1bc2045b7b237c8b839a2b484fb9"

DESCRIPTION="A metaclass for bridging CLOS and JSON objects"
HOMEPAGE="https://github.com/gschjetne/json-mop/"
SRC_URI="https://github.com/gschjetne/json-mop/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/yason
	dev-lisp/anaphora
"

src_prepare() {
	eapply_user
	rm -rf tests
}
