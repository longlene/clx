# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="A CoAP implementation in C"
HOMEPAGE="https://github.com/obgm/libcoap"
SRC_URI="https://github.com/obgm/libcoap/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 BSD )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	insinto /usr/include/coap
	doins address.h async.h bits.h block.h coap.h coap_list.h coap_time.h debug.h encode.h hashkey.h lwippools.h mem.h net.h option.h pdu.h prng.h resource.h str.h subscribe.h t_list.h uri.h uthash.h utlist.h
	dolib.a libcoap.a
	dobin examples/{coap-client,coap-server}
	dodoc README
}
