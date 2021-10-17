# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib flag-o-matic

DESCRIPTION="The data templating language"
HOMEPAGE="http://google.github.io/jsonnet/"
SRC_URI="https://github.com/google/jsonnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	if test-flag-CXX -std=c++0x; then
		append-cxxflags -std=c++0x
	else
		die "C++0x not supported by currently used C++ compiler"
	fi
	append-cxxflags -fPIC -Iinclude
	append-cflags -fPIC -Iinclude
}

src_compile() {
	emake libjsonnet.so libjsonnet++.so jsonnet
}

src_install() {
	dolib.so libjsonnet{,++}.so
	dobin jsonnet
	insinto /usr/include
	doins include/libjsonnet{,++}.h

	dodoc README.md
}
