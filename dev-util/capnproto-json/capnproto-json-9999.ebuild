# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="A capnp compiler that outputs the descriptors as json"
HOMEPAGE="https://github.com/paperstreet/capnproto-json"
SRC_URI=""

EGIT_REPO_URI="https://github.com/paperstreet/capnproto-json.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/capnproto
	sys-devel/clang
"
RDEPEND="${DEPEND}"

src_compile() {
	clang++ -std=c++11 -stdlib=libc++ -Wall -lcapnp -lkj -pthread capnp-json.c++ -o capnp-json
}
src_install() {
	dobin capnp-json
	dodoc README.md
}
