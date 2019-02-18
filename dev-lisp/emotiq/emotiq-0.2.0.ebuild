# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Emotiq"
HOMEPAGE="https://github.com/emotiq/emotiq"
SRC_URI="https://github.com/emotiq/emotiq/archive/mvp-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/simple-date-time
	dev-lisp/ironclad
	dev-lisp/bordeaux-threads
	dev-lisp/cosi-bls
	dev-lisp/quri
	dev-lisp/cl-ppcre
	test? ( dev-lisp/lisp-unit )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd src/test src/t src/Cosi-BLS/cosi-bls-test.asd src/Cosi-BLS/test src/Cosi-Schnorr/{cosi-schnorr-test.asd,t}
}
