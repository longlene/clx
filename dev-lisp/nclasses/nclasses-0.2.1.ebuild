# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Simplify class like definitions with define-class and friends"
HOMEPAGE="https://github.com/atlas-engineer/nclasses"
SRC_URI="https://github.com/atlas-engineer/nclasses/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/moptilities
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "nclasses\/tests/,$d' \
		-i ${PN}.asd
	rm -rf test
}
