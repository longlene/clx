# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b498f3462fadb0e765ffc187562510de0c463ba7"

DESCRIPTION="A high performance math library useful for making games"
HOMEPAGE="https://github.com/mfiano/gamebox-math"
SRC_URI="https://github.com/mfiano/gamebox-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/golden-utils
	dev-lisp/defpackage-plus
	dev-lisp/varjo
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.tests.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
