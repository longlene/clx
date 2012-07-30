# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.5"
PYTHON_USE_WITH="threads"

inherit eutils python

MY_P=${PN}_${PV}
DESCRIPTION="Simple Gtk+ Interface to Mount ISO, IMG, BIN, MDF and NRG Image files without burning to disk"
HOMEPAGE="http://www.marcus-furius.com/?page_id=170"
SRC_URI="http://launchpad.net/${PN}/python/${PV}/+download/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="brasero"

RDEPEND="dev-python/pygobject:2
	dev-python/pygtk:2
	sys-fs/fuseiso
	gnome-base/nautilus
	x11-libs/gksu
	brasero? ( app-cdr/brasero )"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	# The tarball ships *.pyc files, but we don't want to install them, do we?
	rm -f src/*.pyc

	# Change python binary call and path to main in furiusisomount
	sed -e 's:^python "\(src/main.py\)":'$(PYTHON -a)' "/usr/share/'${PN}'/\1":' -i ${PN} || die "sed failed"

	# Disable the nautilus radio button because we can't use it anyway, Gentoo does not have nautilus-cd-burner
	sed -e '/<widget class="GtkRadioButton" id="radiobutton_nautilus">/ a\
                                 <property name="sensitive">False</property>' -i res/main_window.glade

	# If brasero is disabled, we disable all burning-related widgets
	if ! use brasero; then
		sed -e '/<widget class="GtkRadioButton" id="radiobutton_brasero">/ a\
                                 <property name="sensitive">False</property>' -i res/main_window.glade
		sed -e "s/self.interface.get_widget('button_burn').set_sensitive(True)/#&/" -i src/main.py
	fi

	python_convert_shebangs -r 2 src
}

src_install() {
	insinto /usr/share/${PN}/
	doins -r src res po pix locale || die "doins failed"

	dobin ${PN} || die "dobin failed"
	doicon pix/${PN}.png || die "doicon failed"
	newmenu app.desktop ${PN}.desktop || die "newmenu failed"
}

pkg_postinst() {
	python_mod_optimize /usr/share/${PN}/src/
}

pkg_postrm() {
	python_mod_cleanup /usr/share/${PN}/src/
}
