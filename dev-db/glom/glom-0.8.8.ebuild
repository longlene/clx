# Distributed under the terms of the GNU GPL v2

# epatch needed, gnome2_src_install [to avoid scrollkeeper access violation]
inherit eutils gnome2

KEYWORDS="~x86"
IUSE=""
DESCRIPTION="FileMaker Pro-like GUI database designer"
HOMEPAGE="http://www.glom.org/"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/glom/0.8/${P}.tar.bz2"
LICENSE="LGPL-2"

# The dependencies listed on the website are bogus - they refer to
# versions of programs that don't exist.  The makefile checks
# for the same versions.  The Changelog refers to an older bakery
# The program builds and runs with the latest released, namely:
DEPEND=">=bakery-2.3.8
		>=libgdamm-1.3"


src_unpack(){
	unpack ${P}.tar.bz2 || die "Unpacking glom failed."
	cd ${P}
	epatch ${FILESDIR}/i18n.diff || die "Don't expect this to build... patch failed."
}

src_compile(){
	econf || die "Configuring glom failed"
	emake || die "Building glom failed"
}

src_install(){
	gnome2_src_install
}



