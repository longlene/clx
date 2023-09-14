# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Simple library to speed up or slow down speech"
HOMEPAGE="https://github.com/waywardgeek/sonic"
SRC_URI="https://github.com/waywardgeek/sonic/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/install/{s#/lib#/$(get_libdir)#}" \
		-e "/ln/{s#/lib#/$(get_libdir)#}" \
		-e "/LIBDIR=/{s#/lib#/$(get_libdir)#}" \
		-i Makefile
}
