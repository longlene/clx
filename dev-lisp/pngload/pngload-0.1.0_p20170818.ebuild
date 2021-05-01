# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc68d8cd3b25534b99a189c858fb97a130286031"

DESCRIPTION="A PNG (Portable Network Graphics) image format decoder"
HOMEPAGE="https://github.com/mfiano/pngload"
SRC_URI="https://github.com/mfiano/pngload/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/fast-io
	dev-lisp/babel
	dev-lisp/chipz
	test? ( dev-lisp/local-time dev-lisp/opticl dev-lisp/png )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd test
}
