# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="It lets you view and chat with all your Skype buddies from within Pidgin"
HOMEPAGE="http://code.google.com/p/skype4pidgin/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

LANGS="de en_AU es fr hu it ja nb pl pt ru"
for X in ${LANGS}; do IUSE_LINGUAS="${IUSE_LINGUAS} linguas_${X}"; done
IUSE="${IUSE_LINGUAS}"

ESVN_REPO_URI="http://skype4pidgin.googlecode.com/svn/trunk"

RDEPEND="net-im/pidgin
	net-im/skype"

DEPEND="${RDEPEND}"

src_compile() {
	emake all || die "all"
}

src_install() {
	emake DESTDIR="${D}" install || die
	
	for lng in ${LANGS}; do
		if use linguas_${lng}; then
			einfo "Installing localisation for ${lng}"
			insinto /usr/share/locale/${lng}/LC_MESSAGES/
			newins po/${lng}.mo skype4pidgin.mo || die "newins failed"
		fi
	done
}

pkg_postinst() {
	einfo "To use Skype'smiles, choose [Tools] -> [Preferences], open the"
	einfo "[Smiley Themes] tab and choose [Default-with-Skype] in theme's list"
}
