# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.5"

inherit eutils python

DESCRIPTION="(g)vdown can download videos from sharing websites like
YouTube, Google Video, Stage6 and so on."
HOMEPAGE="http://code.google.com/p/vdown/"
SRC_URI="http://vdown.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND=">=dev-lang/python-2.5
	gtk? ( >=dev-python/pygtk-2
		gnome-base/libglade )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i -e "s:/usr/lib/${PN}/${PN}.glade:/usr/share/${PN}/${PN}.glade:" \
		gui.py
}

src_install() {
	python_version
	insinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
	doins main.py
	exeinto "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
	doexe cli.py

	dosym "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/cli.py" \
	/usr/bin/vdown

	if use gtk ; then
		doexe gui.py
		insinto "/usr/share/${PN}"
		doins gvdown.glade
		doicon nonsrc/${PN}.xpm
		domenu nonsrc/${PN}.desktop
		dosym "/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}/gui.py" \
		/usr/bin/gvdown
	fi
}

pkg_postinst() {
	python_version
	python_mod_optimize "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}

pkg_postrm() {
	python_mod_cleanup
}
