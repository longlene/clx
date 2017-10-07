# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="a4c0c5d981113a0f37186cb85374601f9d69eb60"

DESCRIPTION="HBase FDW"
HOMEPAGE="https://github.com/troels/hbase_fdw"
SRC_URI="https://github.com/troels/hbase_fdw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/JVM_CPPFLAGS/{s#/usr/lib/jvm/java-8-jdk/include#${JAVA_HOME}/include#g}" -i Makefile || die
}
