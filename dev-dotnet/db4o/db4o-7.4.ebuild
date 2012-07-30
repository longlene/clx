# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-dotnet/db4o/db4o-6.1.ebuild,v 1.1 2007/06/24 17:58:59 jurek Exp $

inherit mono multilib eutils

DESCRIPTION="Object database for .NET"
HOMEPAGE="http://www.db4o.com/"
SRC_URI="http://www.db4o.com/downloads/${P}-net2.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-lang/mono"

S="${WORKDIR}/${P}/src"

src_unpack() {
	unpack ${A}
	cd ${S}

	local cecilver="$(gacutil -l Mono.Cecil |grep Mono.Cecil |cut -d "=" -f 2 |cut -d "," -f 1)"
	local ceciltoken="$(gacutil -l Mono.Cecil |grep Mono.Cecil |cut -d "=" -f 4)"
	epatch "${FILESDIR}/${P}-makefile.patch"
#	rm -rf Libs/ || die
	sed -i -e "s:Mono.Cecil.dll:/usr/$(get_libdir)/mono/gac/Mono.Cecil/${cecilver}__${ceciltoken}/Mono.Cecil.dll:" include.mk || die
#	sed -i -e "s:Cecil.FlowAnalysis.dll:/usr/$(get_libdir)/mono/Cecil.FlowAnalysis/Cecil.FlowAnalysis.dll:" include.mk || die
	sed -i -e "s:Mono.GetOptions.dll:/usr/$(get_libdir)/mono/2.0/Mono.GetOptions.dll:" include.mk || die
}

src_compile() {
#	emake -j1 buildcore || die "emake failed"
	emake -j1 || die "emake failed"
}

src_install() {

	if use doc; then
		emake DESTDIR=${D} install || die "emake install failed"
	else
		# Prevents from installing documentation
		emake RPM_DOC_DIR="." DESTDIR=${D} install || die "emake install failed"
	fi
}
