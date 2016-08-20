# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Cap'n Proto in pure Java"
HOMEPAGE="https://github.com/dwrensha/capnproto-java/"
SRC_URI="https://github.com/dwrensha/capnproto-java/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

COMMON_DEP="dev-libs/capnproto"

DEPEND="dev-libs/capnproto"
RDEPEND="${DEPEND}"

# TODO: build the java specific code

src_install() {
	dobin capnpc-java
	dodoc README.md
}
