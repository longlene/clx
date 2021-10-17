# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit flag-o-matic

DESCRIPTION="a JSON parser and printer library in C"
HOMEPAGE="http://projects.snarc.org/libjson/"
SRC_URI="https://github.com/vincenthz/libjson/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	append-flags "-fPIC"
}
