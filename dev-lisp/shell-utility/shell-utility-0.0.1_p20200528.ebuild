# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b26b92de5a812e13249007387e4696f79e8cf1ee"

DESCRIPTION="A library that let's you generate shell scripts from SBCL"
HOMEPAGE="https://github.com/pve1/shell-utility"
SRC_URI="https://github.com/pve1/shell-utility/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/apply-argv
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:shell-utility\/tests/,$d' ${PN}.asd
		rm shell-utility-tests.lisp
	fi
}
