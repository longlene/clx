# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Annotates RCS files in a style similar to CVS's annotate command"
HOMEPAGE="http://blame.sourceforge.net/"
SRC_URI="mirror://sourceforge/blame/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

# sys-devel/bison and sys-devel/flex are not needed because the tarball comes
# with prebuilt parser.y output, but be careful with bumps and patches
DEPEND=""
# blame doesn't actually use RCS provided commands, and can parse RCS generated
# files without dev-vcs/rcs.
RDEPEND=""

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"

	dodoc AUTHORS ChangeLog NEWS README
}
