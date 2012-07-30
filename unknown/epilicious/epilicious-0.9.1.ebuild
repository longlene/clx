# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An Epiphany extension to synchronise bookmarks with a Delicious account."
HOMEPAGE="http://therning.org/magnus/computer/epilicious/"
SRC_URI="http://www.therning.org/magnus_files/epilicious/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	www-client/epiphany
	dev-python/elementtree
	dev-python/feedparser"

src_compile() {
	EPIPHANY_VER=$(best_version www-client/epiphany |cut -d- -f3 |cut -d. -f1,2)
	emake DESTINATION=/usr/lib/epiphany/${EPIPHANY_VER}/extensions \
		|| die "make failed"
}

src_install() {
	EPIPHANY_VER=$(best_version www-client/epiphany |cut -d- -f3 |cut -d. -f1,2)
	make install \
		DESTDIR=${D} \
		DESTINATION=/usr/lib/epiphany/${EPIPHANY_VER}/extensions \
		GCONF_INSTALL_SCHEMAS=n \
		LOCALE_INSTALL_LANGS=y
	insinto /etc/gconf/schemas
	doins epilicious.schemas
}

pkg_postinst() {
	GCONFTOOL_BIN="${ROOT}/usr/bin/gconftool-2"
	export GCONF_CONFIG_SOURCE=$(${GCONFTOOL_BIN} --get-default-source)
	${GCONFTOOL_BIN} --makefile-install-rule /etc/gconf/schemas/epilicious.schemas 1>/dev/null
}
