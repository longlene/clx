# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit multilib

DESCRIPTION="Manipulate Skype from within Pidgin"
HOMEPAGE="http://code.google.com/p/skype4pidgin/"
SRC_URI="http://dev.gentooexperimental.org/~chewi/distfiles/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus nls X"

CDEPEND="dev-libs/glib:2
	net-im/pidgin"

DEPEND="${CDEPEND}
	dev-util/pkgconfig
	dbus? ( dev-libs/dbus-glib )
	nls? ( sys-devel/gettext )
	X? ( x11-proto/xproto x11-libs/libX11 )"

RDEPEND="${CDEPEND}
	net-im/skype"

src_compile() {
	local GLIB_CFLAGS=`pkg-config --cflags glib-2.0`
	local LIBPURPLE_CFLAGS=`pkg-config --cflags purple`" -DPURPLE_PLUGINS"
	local COMMON_CFLAGS="-Wall -shared -fPIC"

	if use nls; then
		emake locales || die
		LIBPURPLE_CFLAGS=${LIBPURPLE_CFLAGS} -DENABLE_NLS
	fi

	gcc ${COMMON_CFLAGS} -DSKYPENET ${CFLAGS} ${LDFLAGS} ${GLIB_CFLAGS} \
		 ${LIBPURPLE_CFLAGS} -I. libskype.c -o libskypenet.so || die

	if use dbus; then
		local DBUS_CFLAGS=`pkg-config --cflags dbus-glib-1`
		gcc ${COMMON_CFLAGS} -DSKYPE_DBUS ${CFLAGS} ${LDFLAGS} ${DBUS_CFLAGS} \
			${LIBPURPLE_CFLAGS} -I. libskype.c -o libskype_dbus.so || die
	fi

	if use X; then
		local X_CFLAGS=`pkg-config --cflags x11 xproto`
		gcc ${COMMON_CFLAGS} ${CFLAGS} ${LDFLAGS} ${GLIB_CFLAGS} ${X_CFLAGS} \
			${LIBPURPLE_CFLAGS} -I. libskype.c -o libskype.so || die
	fi
}

src_install() {
	local lang

	exeinto /usr/$(get_libdir)/purple-2
	doexe *.so || die

	insinto /usr/share/pixmaps/pidgin/protocols
	doins -r icons/* || die

	insinto /usr/share/pixmaps/pidgin/emotes/skype
	doins theme || die

	dodoc CHANGELOG.txt README.txt TODO.txt || die

	if use nls; then
		for lang in po/*.mo; do
			lang=${lang%.mo}
			lang=${lang##*/}
			insinto /usr/share/locale/${lang}/LC_MESSAGES
			newins po/${lang}.mo skype4pidgin.mo || die
		done
	fi
}

pkg_postinst() {
	einfo "To use Skype's smilies, choose [Tools] -> [Preferences], open the"
	einfo "[Smiley Themes] tab and choose [Default-with-Skype] in the themes list."
}
