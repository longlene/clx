# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/colinmarc/hdfs/..."

DESCRIPTION="A native go client for HDFS"
HOMEPAGE="https://github.com/colinmarc/hdfs"
SRC_URI="https://github.com/colinmarc/hdfs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	newbin bin/hdfs gohdfs
}
