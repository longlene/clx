# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tool to create initramfs images"
HOMEPAGE="https://github.com/alpinelinux/mkinitfs"
SRC_URI="https://github.com/alpinelinux/mkinitfs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libbsd
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/-Werror/{s#-Werror##}' \
		-e'/^LIBS.*=/{s#$# -pthread -lbsd#}' \
		-i Makefile || die
	sed -e '/#include/{s#string.h#bsd/string.h#}' nlplug-findfs.c || die
}
