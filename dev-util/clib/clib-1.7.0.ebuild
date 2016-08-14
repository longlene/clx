# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="C package manager-ish"
HOMEPAGE="https://github.com/clibs/clib"
SRC_URI="https://github.com/clibs/clib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="${D}"/usr install
	dodoc Readme.md
}
