# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools

DESCRIPTION="C language wrapper for RE2 the regular expressions library from Google"
HOMEPAGE="https://github.com/marcomaggi/cre2/"
SRC_URI="https://github.com/marcomaggi/cre2/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/re2"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
