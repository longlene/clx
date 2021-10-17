# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="Templating system for guile"
HOMEPAGE="https://github.com/sirius94/guile-template"
SRC_URI="https://github.com/sirius94/guile-template/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
