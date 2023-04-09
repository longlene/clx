# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eba52a0e9be84b7c73c0231779b0744c29c10cbf"

DESCRIPTION="A natural language understanding system for English"
HOMEPAGE="https://github.com/ddmcdonald/sparser"
SRC_URI="https://github.com/ddmcdonald/sparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-dot
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :sparser\/tests/,/do-tests/d' ${PN}.asd
		rm -r test
	fi
}

