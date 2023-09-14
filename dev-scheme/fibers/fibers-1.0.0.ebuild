# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="Erlang-like concurrency for Guile"
HOMEPAGE="https://github.com/wingo/fibers"
SRC_URI="https://github.com/wingo/fibers/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=">=dev-scheme/guile-2.2"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

