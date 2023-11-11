# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="17d5cdd65405f1d26e26f3e875e70027d0c8eedb"

DESCRIPTION="A simple Common Lisp interface to OpenSSL."
HOMEPAGE="http://common-lisp.net/project/cl-plus-ssl/"
SRC_URI="https://github.com/cl-plus-ssl/cl-plus-ssl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lisp/cffi-0.10.6-r1
	dev-lisp/trivial-gray-streams
	dev-lisp/flexi-streams
	dev-libs/openssl
"

src_prepare() {
	default
	use test || rm -r cl+ssl.test.asd test
}

src_compile() {
	:
}
