# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="C/C++ JSON parser, emitter, JSON-RPC engine for embedded systems"
HOMEPAGE="https://github.com/cesanta/mjson"
SRC_URI="https://github.com/cesanta/mjson/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins src/mjson.h
	dodoc README.md
}
