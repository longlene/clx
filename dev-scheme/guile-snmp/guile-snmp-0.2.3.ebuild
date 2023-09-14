# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot autotools

DESCRIPTION="Guile bindings for Net-SNMP with a powerful reporting dialect"
HOMEPAGE="https://github.com/tcolgate/guile-snmp"
SRC_URI="https://github.com/tcolgate/guile-snmp/archive/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	net-analyzer/net-snmp
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
