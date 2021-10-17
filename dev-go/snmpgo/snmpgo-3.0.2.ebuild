# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/k-sone/snmpgo"

DESCRIPTION="snmpgo is a golang implementation for SNMP"
HOMEPAGE="https://github.com/k-sone/snmpgo"
SRC_URI="https://github.com/k-sone/snmpgo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
