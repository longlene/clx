# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

EGIT_REPO_URI="https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"

inherit git-2 gnome2-utils

DESCRIPTION="System monitor extension for GNOME Shell"
HOMEPAGE="https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	>=dev-libs/glib-2.26
	>=gnome-base/gnome-desktop-3:3"
RDEPEND="${COMMON_DEPEND}
	gnome-base/gnome-desktop:3[introspection]
	media-libs/clutter:1.0[introspection]
	net-libs/telepathy-glib[introspection]
	x11-libs/gtk+:3[introspection]
	x11-libs/pango[introspection]"
DEPEND="${COMMON_DEPEND}
	sys-devel/gettext
	>=dev-util/pkgconfig-0.22
	>=dev-util/intltool-0.26
	gnome-base/gnome-common"

pkg_preinst()	{

	cd ${WORKDIR}/gnome-shell-extensions-system-monitor-9999
	mkdir -p ${D}/usr/share/gnome-shell/extensions/
	cp -R system-monitor@paradoxxx.zero.gmail.com ${D}/usr/share/gnome-shell/extensions
	mkdir -p ${D}/usr/share/glib-2.0/schemas
	cp org.gnome.shell.extensions.system-monitor.gschema.xml ${D}/usr/share/glib-2.0/schemas
	mkdir -p ${D}/usr/bin
	cp system-monitor-applet-config.py ${D}/usr/bin/system-monitor-applet-config
	mkdir -p ${D}/usr/share/applications
	cp system-monitor-applet-config.desktop ${D}/usr/share/applications

        gnome2_schemas_savelist

}

pkg_postinst()  {

        gnome2_schemas_update

}

pkg_postrm()    {

        gnome2_schemas_update --uninstall

}
