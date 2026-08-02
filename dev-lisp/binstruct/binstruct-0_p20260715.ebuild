# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

COMMIT="2e598518e4feebfec0d2b75a3d02a523122be7bd"

DESCRIPTION="Declarative binary structure encoding and decoding for Common Lisp"
HOMEPAGE="https://github.com/bohonghuang/binstruct"
SRC_URI="https://github.com/bohonghuang/binstruct/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P}.gh"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/float-features
	dev-lisp/parsonic
"
