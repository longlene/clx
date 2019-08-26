# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="JSON module for Guile"
HOMEPAGE="https://github.com/aconchillo/guile-json"
SRC_URI="http://download.savannah.gnu.org/releases/guile-json/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-scheme/guile"
RDEPEND="${DEPEND}"
