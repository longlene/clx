# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0fb0a9e5773148fd04d50efef08c1cc10f6fc487"

DESCRIPTION="A library of ASCII encoding schemes for binary data"
HOMEPAGE="https://github.com/froydnj/binascii"
SRC_URI="https://github.com/froydnj/binascii/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :binascii-tests/,$d' \
		-i binascii.asd
	rm -rf tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all LICENSE
}
