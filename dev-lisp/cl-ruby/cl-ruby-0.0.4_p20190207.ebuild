# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7ff8ea4306967e22b471f5bedf1bd7ae17740838"

DESCRIPTION="A Common Lisp to Ruby FFI"
HOMEPAGE="https://github.com/Ninjacop/cl-ruby"
SRC_URI="https://github.com/Ninjacop/cl-ruby/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
