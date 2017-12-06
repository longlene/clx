# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="32b11745f5b1d0f359761daef6977483fa586436"

DESCRIPTION="Osicat is a lightweight operating system interface for Common Lisp"
HOMEPAGE="https://github.com/osicat/osicat"
SRC_URI="http://github.com/osicat/osicat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-features
	test? ( dev-lisp/rt )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests
}
