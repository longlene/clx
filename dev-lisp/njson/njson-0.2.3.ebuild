# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A JSON handling framework aiming for convenience and brevity"
HOMEPAGE="https://github.com/atlas-engineer/njson"
SRC_URI="https://github.com/atlas-engineer/njson/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "njson\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}