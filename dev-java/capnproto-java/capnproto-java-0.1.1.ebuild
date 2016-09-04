# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit java-utils-2

DESCRIPTION="Cap'n Proto in pure Java"
HOMEPAGE="https://github.com/dwrensha/capnproto-java/"
SRC_URI="https://github.com/dwrensha/capnproto-java/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

COMMON_DEP="dev-libs/capnproto"

DEPEND="
	dev-libs/capnproto
	virtual/jdk:*
"
RDEPEND="${DEPEND}"

src_compile() {
	emake
	cd runtime/src && \
		javac main/java/org/capnproto/*.java && \
		jar cf capnproto.jar main/java/org/capnproto/*class
}
src_install() {
	insinto /usr/include/capnp
	doins compiler/src/main/schema/capnp/java.capnp
	#insinto /usr/share/${PN}
	#doins runtime/src/capnproto.jar
	java-pkg_newjar runtime/src/capnproto.jar
	dobin capnpc-java
	dodoc README.md
}
