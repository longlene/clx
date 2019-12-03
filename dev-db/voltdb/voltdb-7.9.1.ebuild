# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 vcs-snapshot

DESCRIPTION="An in-memory database with pre-compiled Java stored procedures (Community Edition)"
HOMEPAGE="http://community.voltdb.com/"
SRC_URI="https://github.com/VoltDB/voltdb/archive/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-java/ant-core
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i '1{s#python2.6#python#}' tools/vmc_stats_emulator.py
	python_fix_shebang -q bin/{voltadmin,voltdb,voltdeploy} tools \
		lib/python/{,vdm,voltcli} \
		third_party/python/schemaobject/{,schemaobject,tests}
	sed -e "/VOLTDB_VOLTDB=/{s#lib/voltdb#lib/voltdb/voltdb#}" \
		-e "/VOLTDB_LIB=/{s#VOLTDB_VOLTDB#VOLTDB_VOLTDB/../lib#}" \
		-i bin/*
}

src_compile() {
	ant || die "compile fail"
}

src_install() {
	local voltdbhome=usr/$(get_libdir)/${PN}
	into "/${voltdbhome}"
	dobin bin/*
	local mycmd
	for mycmd in csvloader jdbcloader kafkaloader rabbitmqloader snapshotconvert snapshotverifier sqlcmd voltadmin voltcompiler voltdb ; do
		dosym "/${voltdbhome}"/bin/$mycmd /usr/bin/$mycmd
	done

	insinto ${voltdbhome}
	doins -r bundles lib third_party tools voltdb version.txt
	dodoc -r doc examples
}
