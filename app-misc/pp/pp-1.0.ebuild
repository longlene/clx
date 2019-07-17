# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="a preprocessor"
HOMEPAGE="https://adi.tilde.institute/pp/"
SRC_URI="https://adi.tilde.institute/pp/${P}.tgz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	default
	sed -e '/PREFIX =/{s#/usr/local#/usr#}' \
		-e '/LDFLAGS =/{s#-s##}' \
		-i makefile
}
