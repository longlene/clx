# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils python

DESCRIPTION="Delivers stunning wallpapers to your desktop, directly from Flickr and Webshots."
HOMEPAGE="http://www.webilder.org/"

SRC_URI="http://www.webilder.org/static/downloads/Webilder-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde"

RDEPEND="kde? ( kde-base/kdelibs:3.5 )
	dev-python/pygtk
	dev-python/gnome-python
	dev-python/gnome-python-desktop
	gnome-base/libgnomeui
	dev-python/gnome-python-extras
	dev-python/imaging"

DEPEND="${RDEPEND}"

src_install() {
	cd ${WORKDIR}/Webilder-${PV}
	if use kde; then
		python setup.py install --with-kde --root=${D} || die "Install failed"
	else
		python setup.py install --root=${D} || die "Install failed"
	fi
}

pkg_postinst() {
	python_version
	python_mod_optimize "/usr/$(get_libdir)/python${PYVER}/site-packages/webilder"
}

pkg_postrm() {
	python_version
	python_mod_cleanup "/usr/$(get_libdir)/python${PYVER}/site-packages/webilder"
}

pkg_postinst() {
	elog "After installing Webilder, you should add it to your panel, so it can"
	elog "automatically download photos and change your wallpaper."
	elog "GNOME Users: Right-click on the GNOME panel, choose 'Add to panel',"
	elog "and select 'Webilder Webshots Applet'."
	elog "If it is not in the list - log off and log in again."
	
	if use kde; then
		elog "KDE Users: From the graphics menu, start KWebilder. Go to the"
		elog "preferences Window, to the Advanced Tab, and select KDE wallpapers"
		elog "settings."
	fi

}
