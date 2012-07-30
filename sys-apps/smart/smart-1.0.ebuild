# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

# TODO slackware support

inherit eutils

DESCRIPTION="Smart Package Manager is a next generation package handling tool"
HOMEPAGE="http://smartpm.org"
SRC_URI="http://labix.org/download/smart/${P}.tar.bz2"

# pygtk enables the graphical interface
# rpm enables the rpm backend
# deb enables the dpkg backend
# slack enables the slackware backend
IUSE="pygtk rpm deb slack
	linguas_de linguas_es_ES linguas_fr linguas_hu linguas_it
	linguas_pt_BR linguas_ru linguas_sv linguas_zh_CN linguas_zh_TW"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

RDEPEND=">virtual/python-2.3
	pygtk? ( dev-python/pygtk )
	rpm? ( app-arch/rpm )
	deb? ( app-arch/dpkg )"
	# slack? ( slackware packaging scripts? )

smart_remove_use() {
	if [ "$1" = "pygtk" ]; then
		rm -fr "${D}usr/lib/python2.5/site-packages/smart/interfaces/gtk"
	else
		rm -fr "${D}usr/lib/python2.5/site-packages/smart/backends/$1"
	fi
}

smart_remove_locale() {
	rm -fr "${D}/usr/share/locale/$1"
}

pkg_setup() {
	if use rpm && ! built_with_use app-arch/rpm python; then
		#The RPM backend depends on the Python `rpm` module of RPM 4.4 or higher.
		eerror "This package requires app-arch/rpm compiled with Python support."
		die "Please reinstall app-arch/rpm with USE=\"python\"."
	fi
}

src_install() {
 	emake DESTDIR="${D}" install || die "install failed"

	# Delete use options not in use
	if ! use pygtk; then smart_remove_use pygtk; fi
	if ! use rpm; then smart_remove_use rpm; fi
	if ! use deb; then smart_remove_use deb; fi
	if ! use slack; then smart_remove_use slack; fi

	# Delete locales if not used
	if ! use linguas_de; then smart_remove_locale de; fi
	if ! use linguas_es_ES; then smart_remove_locale es_ES; fi
	if ! use linguas_fr; then smart_remove_locale fr; fi
	if ! use linguas_hu; then smart_remove_locale hu; fi
	if ! use linguas_it; then smart_remove_locale it; fi
	if ! use linguas_pt_BR; then smart_remove_locale pt_BR; fi
	if ! use linguas_ru; then smart_remove_locale ru; fi
	if ! use linguas_sv; then smart_remove_locale sv; fi
	if ! use linguas_zh_CN; then smart_remove_locale zh_CN; fi
	if ! use linguas_zh_TW; then smart_remove_locale zh_TW; fi
}

pkg_postinst() {
	# "smart --shell" complains if /var/lib/dpkg/status doesn't exist.
	# create it, no idea if this is the proper way of resolving this...
	if [ ! -e "/var/lib/dpkg/status" ]; then touch /var/lib/dpkg/status; fi
}