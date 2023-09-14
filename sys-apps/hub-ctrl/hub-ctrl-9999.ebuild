# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3

DESCRIPTION="Control USB power on a port by port basis on some USB hubs"
HOMEPAGE="https://github.com/codazoda/hub-ctrl.c"
SRC_URI=""

EGIT_REPO_URI="https://github.com/codazoda/hub-ctrl.c.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="virtual/libusb"
RDEPEND="${DEPEND}"

src_compile() {
	gcc -o hub-ctrl hub-ctrl.c -lusb
}

src_install() {
	dosbin hub-ctrl
}
