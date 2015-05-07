# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib flag-o-matic

DESCRIPTION="The data templating language"
HOMEPAGE="http://google.github.io/jsonnet/"
SRC_URI="https://github.com/google/jsonnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="vim-syntax"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_pretend() {
	if test-flag-CXX -std=c++11; then
		append-cxxflags -std=c++11
	else
		die "C++11 not supported by currently used C++ compiler"
	fi
}

src_compile() {
	emake jsonnet || die "compile failed"
	emake libjsonnet.so || die "compile failed"
}

src_install() {
	dobin jsonnet
	dolib.so libjsonnet.so
	insinto /usr/include
	doins libjsonnet.h

	dodoc README

	if use vim-syntax ; then
		insinto /usr/share/vim/vimfiles/syntax
		doins editors/vim/syntax/jsonnet.vim
	fi
}
