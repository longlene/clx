# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic vcs-snapshot

DESCRIPTION="The V Programming Language"
HOMEPAGE="https://vlang.io/"
SRC_URI="
	https://github.com/vlang/v/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vlang/vc/archive/b8cd2ac8060ef26fcf413509173264b31dd5a6f4.tar.gz -> v.c-${PV}.tar.gz
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

src_prepare() {
	default
	local vdir=${S}/
	cp compiler/main.v main.v.bak
	sed -i "s|mut lang_dir := ''|mut lang_dir := '${vdir}'|g"  compiler/main.v
	sed -i "s|mut lang_dir := ''|mut lang_dir := '/usr/lib/v'|g" main.v.bak
}

src_compile() {
	$(tc-getCC) -w -o vc ${WORKDIR}/v.c-${PV}/v.c
	./vc -o v compiler && mv main.v.bak compiler/main.v && ./v -o v compiler
}

src_install() {
	dobin v
	insinto /usr/$(get_libdir)/v
	doins -r vlib
	dodoc -r examples README.md
}
