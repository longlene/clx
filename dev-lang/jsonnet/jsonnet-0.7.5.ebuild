# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib flag-o-matic

DESCRIPTION="The data templating language"
HOMEPAGE="http://google.github.io/jsonnet/"
SRC_URI="mirror://github/google/jsonnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="vim-syntax"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	if test-flag-CXX -std=c++0x; then
		append-cxxflags -std=c++0x
	else
		die "C++0x not supported by currently used C++ compiler"
	fi
	append-cxxflags -fPIC
	append-cflags -fPIC
}

src_compile() {
	make libjsonnet.so || die "compile failed"
	make jsonnet || die "compile failed"
}

src_install() {
	dolib.so libjsonnet.so
	dobin jsonnet
	insinto /usr/include
	doins libjsonnet.h

	dodoc README

	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax
		doins editors/vim/syntax/jsonnet.vim
	fi
}
