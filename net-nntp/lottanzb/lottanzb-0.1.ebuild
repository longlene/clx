# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils

DESCRIPTION="LottaNZB is a pyGTK front-end for HellaNZB"
HOMEPAGE="http://lottanzb.org"
SRC_URI="http://lottanzb.org/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python
   dev-python/pygtk"
RDEPEND="${DEPEND}
   net-nntp/hellanzb"

S="${WORKDIR}/${PN}"
