# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Python/C++ implementation of JSON to/from Protobuf convertor"
HOMEPAGE="https://github.com/shramov/json2pb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/shramov/json2pb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/jansson"
RDEPEND="${DEPEND}"

src_compile() {
	emake libjson2pb.so
}

src_install() {
	dolib.so libjson2pb.so
	insinto /usr/include
	doins json2pb.h
	dodoc README.md
}
