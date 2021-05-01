# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e71e7cf611ecd4a27bf5dba3add8698acda762ea"

DESCRIPTION="Scrape on-line documentation out of a running Lisp image"
HOMEPAGE="https://github.com/eugeneia/trivial-documentation"
SRC_URI="https://github.com/eugeneia/trivial-documentation/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
