# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic vcs-snapshot

VC_PV="0.2_p20210729"

DESCRIPTION="The V Programming Language"
HOMEPAGE="https://vlang.io/"
SRC_URI="
	https://github.com/vlang/v/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vlang/vc/archive/a9b977818614571348a3642a5a29a3c465a4cf7f.tar.gz -> vc-${VC_PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/glfw
	net-misc/curl
	media-libs/freetype
"
BDEPEND=""

src_compile() {
	$(tc-getCC) -w -o v ${WORKDIR}/vc-${VC_PV}/v.c -lm -lpthread
	./v self
}

src_install() {
	insinto /usr/$(get_libdir)/v
	doins -r vlib v.mod
	exeinto /usr/$(get_libdir)/v
	doexe v
	dosym /usr/$(get_libdir)/v/v /usr/bin/v
	dodoc -r examples README.md
}
