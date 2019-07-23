# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="238d8ec615cd92fb7fe485eb1c26ddf7fa832a91"

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
