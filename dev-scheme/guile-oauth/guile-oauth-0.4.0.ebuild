# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="OAuth module for Guile"
HOMEPAGE="https://github.com/aconchillo/guile-oauth"
SRC_URI="https://github.com/aconchillo/guile-oauth/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-scheme/guile-json
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
