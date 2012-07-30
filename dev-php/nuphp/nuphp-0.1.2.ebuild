# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


#EAPI=0

inherit php-lib-r1

DESCRIPTION="This is a PHP4 and PHP5 library used by NuFace and other projects"

HOMEPAGE="http://software.inl.fr/trac/wiki/NuPHP"

SRC_URI="http://software.inl.fr/releases/Nuphp/${P}.tar.bz2"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

need_php_by_category

src_install() {
        php-lib-r1_src_install nuphp $(cd nuphp ; find . -type f -print)

}

pkg_postinst() {
        elog "These files are part of NuFace, the Web Interface for the NuFW project. For more info, please take a look at the web site:"
        elog "http://software.inl.fr/trac/wiki/EdenWall/NuFW"
}

