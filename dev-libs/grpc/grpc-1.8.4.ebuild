# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A high performance, open source, general RPC framework"
HOMEPAGE="http://www.grpc.io/"
SRC_URI="https://github.com/grpc/grpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/gflags
	dev-libs/openssl
	dev-libs/protobuf
	dev-util/re2c
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's/ldconfig/true/' \
		-e 's/$(Q) $(STRIP)/#$(Q) $(STRIP)/' \
		-e "s#\$(prefix)/lib#\$(prefix)/$(get_libdir)#" \
		-i Makefile
}

src_install() {
	emake prefix="${D}"/usr install
}
