# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

ESVN_REPO_URI="svn://dev.jabbim.cz/jabbim/trunk"

inherit subversion eutils

DESCRIPTION="Jabbim is Jabber/XMPP client written in Python language using Qt"
HOMEPAGE="http://dev.jabbim.cz/jabbim"
#SRC_URI="http://disk.jabbim.cz/michich@jabber.cz/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+ssl"

DEPEND="dev-python/ctypes
		>=dev-python/PyQt4-4.3
		>=dev-python/twisted-names-0.4
		>=dev-python/twisted-web-0.7
		>=dev-python/twisted-words-0.5
		dev-python/pysqlite
		ssl? ( dev-python/pyopenssl )"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
	#unpack ${A}
	cd "${S}"
	sed -i \
		-e "s:lrelease-qt4:lrelease:" \
		Makefile || die "sed Makefile failed"
}
src_compile() {
	emake PREFIX="/usr/"|| die "emake failed!"
}

src_install() {
	emake DESTDIR="${D}" install
	make_desktop_entry "${PN}" "JabbIM"
}
