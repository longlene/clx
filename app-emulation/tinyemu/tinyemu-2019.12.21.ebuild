# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="${PV//./-}"

DESCRIPTION="TinyEMU is a system emulator for the RISC-V and x86 architectures"
HOMEPAGE="https://bellard.org/tinyemu/"
SRC_URI="https://bellard.org/tinyemu/tinyemu-${MY_PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl"

DEPEND="
	dev-libs/openssl
	net-misc/curl
	sdl? ( media-libs/libsdl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/tinyemu-2019-12-21

src_prepare() {
	default
	if ! use sdl ; then
		sed -i '/CONFIG_SDL=y/d' Makefile
	fi
}

src_install() {
	dobin temu
	dodoc readme.txt
}

