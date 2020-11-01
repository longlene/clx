# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/scylladb/scylla-tools-java.git"
	inherit git-r3
else
	MY_PV="${PV/_rc/.rc}"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="
		https://github.com/scylladb/scylla-tools-java/archive/scylla-${MY_PV}.tar.gz -> ${MY_P}.tar.gz
		https://github.com/krummas/jstackjunit/archive/master.zip -> jstackjunit.zip
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/scylla-tools-java-scylla-${MY_PV}"
fi

EANT_BUILD_TARGET="jar"
PYTHON_COMPAT=( python2_7 )
JAVA_PKG_IUSE="source doc"

inherit java-pkg-2 java-ant-2 python-single-r1

DESCRIPTION="scylla tools (Java part)"
HOMEPAGE="https://github.com/scylladb/scylla-tools-java"

LICENSE="Apache-2.0"
SLOT="0"

PATCHES=(
	"${FILESDIR}/scylla-tools-3.0_rc1-build.xml.patch"
)

CDEPEND="
	dev-java/antlr:3.5
	>=dev-java/ant-junit-1.9.2
"
RDEPEND="
	${CDEPEND}
	${PYTHON_DEPS}
	>=virtual/jre-1.8"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.8"

RESTRICT="test"

src_prepare() {
	default
	find examples -type f -name \*.xml -exec rm -v {} \; || die
	if has network-sandbox ${FEATURES}; then
		die "Please set '-network-sandbox' when defining the FEATURES variable"
	fi
}

src_install() {
	default

	# find out version
	local origin_version=$(grep '"base.version"' build.xml | sed 's/.*value="\(.*\)".*/\1/g')

	python_setup 2.7
	python_domodule pylib/cqlshlib

	dodoc -r lib/licenses

	insinto /etc/scylla/cassandra
	doins conf/cassandra-env.sh
	doins conf/logback.xml
	doins conf/logback-tools.xml
	doins conf/jvm.options

	insinto /etc/bash_completion.d
	doins dist/common/nodetool-completion

	dobin bin/nodetool
	dobin bin/sstableloader
	dobin bin/cqlsh
	dobin bin/cqlsh.py

	dobin tools/bin/cassandra-stress
	dobin tools/bin/filter_cassandra_attributes.py
	dobin tools/bin/cassandra_attributes.py
	dobin tools/bin/cassandra-stressd
	dobin tools/bin/sstabledump
	dobin tools/bin/sstablelevelreset
	dobin tools/bin/sstablemetadata
	dobin tools/bin/sstablerepairedset

	insinto /usr/share/scylla/cassandra
	doins dist/common/cassandra.in.sh
	doins "build/apache-cassandra-${origin_version}-SNAPSHOT.jar"
	doins "build/apache-cassandra-thrift-${origin_version}-SNAPSHOT.jar"
	doins "build/scylla-tools-${origin_version}-SNAPSHOT.jar"
	doins build/tools/lib/stress.jar
	#
	dosym /usr/share/scylla/cassandra/apache-cassandra-${origin_version}-SNAPSHOT.jar /usr/share/scylla/cassandra/apache-cassandra.jar

	insinto /usr/share/scylla/cassandra/lib
	doins lib/*.jar
	doins lib/*.zip
}
