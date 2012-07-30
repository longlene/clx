# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Adds a entry to Nautilus' contextual menu to rename images to the date in which they were taken"
HOMEPAGE="http://mundogeek.net/nautilus-scripts#nautilus-rename-exif-date"
SRC_URI="http://launchpadlibrarian.net/17362131/${PN}_${PV}-1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=gnome-base/nautilus-2.21.0
	dev-python/nautilus-python"

DOCS="changelog"

src_compile() {
	return
}
