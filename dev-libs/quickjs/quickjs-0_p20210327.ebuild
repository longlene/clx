# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV=2021-03-27
MY_P=${PN}-${MY_PV}

DESCRIPTION="QuickJS Javascript Engine"
HOMEPAGE="https://bellard.org/quickjs/"
SRC_URI="https://bellard.org/quickjs/${MY_P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}

src_prepare() {
	default
	sed -e '/CONFIG_M32=y/d' \
		-e '/CONFIG_LTO=y/d' \
		-e '/prefix=/{s#/local##}' \
		-i Makefile
}

src_install() {
	dobin qjs qjsc qjscalc
	insinto /usr/lib/quickjs
	doins libquickjs*.a
	insinto /usr/include/quickjs
	doins quickjs.h quickjs-libc.h
	dodoc doc/quickjs.html doc/jsbignum.html
}
