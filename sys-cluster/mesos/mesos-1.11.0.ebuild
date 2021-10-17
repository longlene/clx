# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A distributed systems kernel"
HOMEPAGE="http://mesos.apache.org/"
SRC_URI="http://www.apache.org/dist/mesos/${PV}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/gmock
	dev-libs/cyrus-sasl
	dev-libs/elfio
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#elfio/elfio.h#elfio/elfio.hpp#' \
		-e 's#gmock-all.cc#gmock/gmock.h#' \
		-i configure
}

src_configure() {
	#econf --disable-bundled 
	econf --disable-java \
		--disable-python \
		--with-curl=/usr \
		--with-libev=/usr \
		--with-libevent=/usr \
		--with-protobuf=/usr
}
