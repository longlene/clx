# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/dustin/go-coap"
EGIT_COMMIT="1ff546bf7aad1e887608bb490bebc0719514fd55"

DESCRIPTION="Implementation of CoAP in go"
HOMEPAGE="https://github.com/dustin/go-coap"
SRC_URI="https://github.com/dustin/go-coap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
