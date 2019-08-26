# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="redis module for Guile"
HOMEPAGE="https://github.com/aconchillo/guile-redis"
SRC_URI="http://download.savannah.gnu.org/releases/guile-redis/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
