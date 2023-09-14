# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

VC_COMMIT="06cae1fc20bc121f21377b279b58bfdd450b32c9"

DESCRIPTION="The V Programming Language"
HOMEPAGE="https://vlang.io/"
SRC_URI="
	https://github.com/vlang/v/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vlang/vc/archive/${VC_COMMIT}.tar.gz -> vc-${VC_COMMIT}.tar.gz
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
	$(tc-getCC) -w -o v ${WORKDIR}/vc-${VC_COMMIT}/v.c -lm -lpthread
	./v self
}

src_install() {
	insinto /usr/$(get_libdir)/v
	doins -r vlib v.mod
	exeinto /usr/$(get_libdir)/v
	doexe v
	dosym /usr/$(get_libdir)/v/v /usr/bin/v
	einstalldocs
}
