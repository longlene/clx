# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2

MY_PN=JMagick
MY_P=${MY_PN}-${PV%.*}
MY_P2=${MY_PN}-${PV%.*}-${PV#*.*.*.}

DESCRIPTION="Java interface of ImageMagick"
HOMEPAGE="http://sourceforge.net/projects/jmagick/"
SRC_URI="ftp://ftp.imagemagick.org/pub/ImageMagick/java/${MY_P2}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X"

COMMON_DEP="media-gfx/imagemagick
	X? ( x11-libs/libXext x11-libs/libX11 )"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	${COMMON_DEP}"

S="${WORKDIR}/${MY_P2}"

src_compile() {

	econf \
		$(use_with X x) \
		|| die "configure failed"

	emake || die

}

src_install() {
	java-pkg_doso lib/lib${MY_PN}.so
	java-pkg_dojar lib/${PN}.jar

	dodoc README CREDITS RELEASE
	use doc && java-pkg_dojavadoc docs
}
