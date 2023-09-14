# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cf75964bd25e95babf12c3d6946a0884e3c6f3fe"

DESCRIPTION="A modest config file loader library for Common Lisp"
HOMEPAGE="https://github.com/tormaroe/modest-config/"
SRC_URI="https://github.com/tormaroe/modest-config/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.{asd,lisp}
}
