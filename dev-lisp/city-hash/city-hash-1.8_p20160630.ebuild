# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8ffa29dc9a0ef732b4d81c3858507223927671cd"

DESCRIPTION="Common Lisp implementation of Google's CityHash family of hash functions"
HOMEPAGE="https://github.com/brown/city-hash"
SRC_URI="https://github.com/brown/city-hash/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/base
	dev-lisp/nibbles
	dev-lisp/swap-bytes
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd ${PN}_test.lisp
}
