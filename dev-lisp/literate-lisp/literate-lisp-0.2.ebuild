# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="a literate programming tool to write common lisp codes in org mode"
HOMEPAGE="https://github.com/jingtaozf/literate-lisp/"
SRC_URI="https://github.com/jingtaozf/literate-lisp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm literate-demo.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all tangle.org
}
