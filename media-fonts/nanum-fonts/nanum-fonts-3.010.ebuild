# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# ebuild based from media-fonts/unfonts
# $Header: /var/cvsroot/gentoo-x86/media-fonts/nanum-fonts/nanum-fonts-2.0.ebuild,v 1.0 2010/06/21 20:38:03 ganadist Exp $

inherit font

S=${WORKDIR}


DESCRIPTION="Korean Nanum fonts collection"
HOMEPAGE="http://hangeul.naver.com/share.nhn"
SRC_URI="mirror://debian/pool/main/t/ttf-nanum/ttf-nanum_${PV}.orig.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 s390 sh sparc x86 x86-fbsd"
IUSE=""

FONT_SUFFIX="ttf"
FONT_S=${S}/upstream/

# Only installs fonts
RESTRICT="strip binchecks"
