# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="A Matlab-like matrix environment for Guile Scheme"
HOMEPAGE="https://github.com/antoniogarro/guile-matrix"
SRC_URI="https://github.com/antoniogarro/guile-matrix/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="virtual/lapack"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
