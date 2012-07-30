# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils distutils

DESCRIPTION="A sleek music synchronizer written in python"
HOMEPAGE="http://sourceforge.net/projects/musync"
SRC_URI="mirror://sourceforge/musync/${P}.tar.gz"

# Worry-about-later:
IUSE="bash-completion"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-lang/python-2.3
	|| ( >=dev-lang/python-2.5 >=dev-python/ctypes-0.9 )
	>=media-libs/mutagen-1.12"

DEPEND="${RDEPEND}"

DOCS="README"

src_compile() {
	${python} setup.py config || die "setup.py config failed"
}

src_install() {
	distutils_src_install
	# Add installation of bash-completion here!
}

pkg_postinst() {
	echo
	echo "Please look into /usr/share/musync for auxilliary files"
	echo
}
