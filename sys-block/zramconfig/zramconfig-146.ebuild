# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit mercurial toolchain-funcs

EHG_REPO_URI="https://compcache.googlecode.com/hg/"
EHG_REVISION=146

DESCRIPTION="Compressed RAM based block devices"
HOMEPAGE="http://compcache.googlecode.com/"
SLOT=0
SRC_URI=""

LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/hg/sub-projects/zramconfig

src_prepare() {
	find . -name Makefile -exec sed -i \
		-e "s:@gcc:$(tc-getCC) \$(CFLAGS) \$(LDFLAGS):g" \
		{} \; || die
}

src_compile() {
	emake || die
}

src_install() {
	exeinto /sbin
	doexe zramconfig
	doman man/zramconfig.1 || die
	dodoc "$WORKDIR"/hg/{Changelog,README} || die
}
