# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp of raylib"
HOMEPAGE="https://github.com/longlene/cl-raylib"
SRC_URI="https://github.com/longlene/cl-raylib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-games/raylib
	dev-lisp/cffi
"
BDEPEND=""
