# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="introduces wildcard into ASDF package-inferred-system"
HOMEPAGE="https://github.com/privet-kitty/wild-package-inferred-system"
SRC_URI="https://github.com/privet-kitty/wild-package-inferred-system/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "wild-package-inferred-system\/test/,$d' ${PN}.asd
		rm -r test
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
