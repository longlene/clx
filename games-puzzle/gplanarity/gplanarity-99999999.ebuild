# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils subversion toolchain-funcs

DESCRIPTION="Puzzle game involving untangling planar graphs"
HOMEPAGE="http://web.mit.edu/xiphmont/Public/gPlanarity.html"
ESVN_REPO_URI="http://svn.xiph.org/trunk/planarity"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls linguas_cs linguas_es_ES linguas_fr_FR"

RDEPEND=">=media-libs/freetype-2
	>=media-libs/fontconfig-2
	>=x11-libs/gtk+-2.7.2
	>=x11-libs/cairo-1"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_compile() {
	export ADD_DEF="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
	if useq nls; then
		unset DISABLE_NLS
		strip-linguas -u po
		export WANT_LINGUAS="${LINGUAS}"
		ADD_DEF+=" -I/usr/share/gettext"
	else
		export DISABLE_NLS=1
	fi
	emake CC="$(tc-getCC)" LD="$(tc-getCC)" || die "make failed"
	touch target
}

src_install() {
	if useq nls; then
		unset DISABLE_NLS
		strip-linguas -u po
		export WANT_LINGUAS="${LINGUAS}"
	else
		export DISABLE_NLS=1
	fi
	emake BINDIR="${D}/usr/games/bin" install || die "install failed"
	insinto /usr/share/icons
	doins gPicon.png
	make_desktop_entry gPlanarity gPlanarity gPicon.png
}
