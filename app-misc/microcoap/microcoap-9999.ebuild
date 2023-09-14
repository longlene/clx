# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="A small CoAP implemnetation for microcontrollers"
HOMEPAGE="https://github.com/1248/microcoap"
SRC_URI=""

EGIT_REPO_URI="https://github.com/1248/microcoap.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin coap
	dodoc README.md
}
