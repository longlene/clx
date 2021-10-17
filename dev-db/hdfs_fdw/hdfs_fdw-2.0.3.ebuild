# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="PostgreSQL foreign data wrapper for HDFS"
HOMEPAGE="https://github.com/EnterpriseDB/hdfs_fdw"
SRC_URI="https://github.com/EnterpriseDB/hdfs_fdw/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=virtual/jdk-1.6
	dev-db/postgresql
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}

src_compile() {
	JDK_INCLUDE=${JAVA_HOME}/include emake -C libhive
	JDK_INCLUDE=${JAVA_HOME}/include emake
	JAVA_SRC_DIR=libhive/jdbc JAVA_JAR_FILENAME=HiveJdbcClient-1.0.jar java-pkg-simple_src_compile
	#JAVA_JAR_FILENAME=HiveJdbcClient-1.0.jar java-pkg-simple_src_compile
}

src_install() {
	DESTDIR="${D}" emake install
	dolib.so libhive/libhive.so
	java-pkg_newjar HiveJdbcClient-1.0.jar HiveJdbcClient.jar
}
