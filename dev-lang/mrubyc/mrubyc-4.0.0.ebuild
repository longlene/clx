# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight implementation of mruby for embedded systems"
HOMEPAGE="https://github.com/mrubyc/mrubyc"
SRC_URI="https://github.com/mrubyc/mrubyc/archive/refs/tags/release${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mrubyc-release${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="dev-lang/ruby"

src_compile() {
	emake -C src
}

src_install() {
	dolib.a build/libmrubyc.a

	insinto /usr/include/mrubyc
	doins src/*.h
	doins hal/posix/hal.h

	einstalldocs
}
