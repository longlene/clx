# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib

BV_AMD64=0.7.3-1

DESCRIPTION="The Crystal Programming Language"
HOMEPAGE="http://crystal-lang.org"
SRC_URI="https://github.com/manastech/crystal/archive/${PV}.tar.gz -> ${P}.tar.gz
amd64? ( https://github.com/manastech/crystal/releases/download/${PV}/crystal-${BV_AMD64}-linux-x86_64.tar.gz )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/pcl"

src_prepare() {
	sed -i "s/env(\"CRYSTAL_CONFIG_VERSION\")/\"${PV}\"/" src/compiler/crystal/config.cr
	sed -i "s|env(\"CRYSTAL_CONFIG_PATH\")|\"/usr/$(get_libdir)/crystal/src\"|" src/compiler/crystal/config.cr
}
src_compile() {
	PATH=${PATH}:${WORKDIR}/${PN}-${BV_AMD64}/bin
	emake || die "compile failed"
}

src_install() {
	insinto /usr/$(get_libdir)/crystal/
	doins -r src
	dobin .build/crystal
}
