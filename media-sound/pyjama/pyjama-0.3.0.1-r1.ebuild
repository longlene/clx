# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

DESCRIPTION="A Python/GTK application to play free music from Jamendo"
HOMEPAGE="https://launchpad.net/pyjama"
SRC_URI="http://launchpad.net/pyjama/trunk/0.3/+download/${P}_all.tar.gz
         -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gnome"

RDEPEND="dev-python/pygtk
	dev-python/simplejson
	|| ( dev-python/lxml dev-python/pyxml )
	|| ( dev-lang/python:2.6[sqlite] dev-python/pysqlite )
	dev-lang/python:2.6
	>=dev-python/gst-python-0.10
	>=media-plugins/gst-plugins-soup-0.10
	gnome? ( dev-python/gnome-python-extras )"

DEPEND="${DEPEND}"

src_compile() {
	einfo "Nothing to compile for ${P}."
}

src_install() {

    if [ -e /usr/lib/pyjama/pyjama.py ]
    then
       ewarn "Please delete /usr/lib/pyjama!"
       ewarn "This directory is not needed any more"
    fi

    einfo "Copying files"
    dodir /usr/share/apps/pyjama
    cp -R "${S}_all"/src/* ${D}/usr/share/apps/pyjama/
    dosym /usr/share/apps/pyjama/pyjama.py /usr/bin/pyjama

    einfo "Creating menu-entry for pyjama"
    dosym /usr/share/apps/pyjama/images/pyjama.xpm /usr/share/pixmaps/pyjama.xpm
    dosym /usr/share/apps/pyjama/pyjama.desktop /usr/share/applications/pyjama.desktop

    einfo "Pyjama has been installed. Just type 'pyjama' to run it."
}

pkg_postinst()
{
    einfo "Checking modules..."
    ${D}/usr/bin/pyjama check-modules
}
