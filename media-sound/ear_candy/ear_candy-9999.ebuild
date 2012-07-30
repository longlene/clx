# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit bzr distutils

EBZR_REPO_URI="http://bazaar.launchpad.net/~killerkiwi2005/earcandy/"

DESCRIPTION="A sound level manager that fades applications in and out based on their profile and window focus"
HOMEPAGE="https://launchpad.net/earcandy"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DOCS="README COPYING"

DEPEND="media-sound/pulseaudio
	dev-lang/python
	dev-util/bzr"

RDEPEND="${DEPEND}
	dev-python/ctypes
	dev-python/dbus-python
	dev-python/gconf-python
	dev-python/gst-python
	dev-python/pyalsa
	dev-python/pyalsaaudio
	dev-python/pygobject
	dev-python/pygtk
	dev-python/pyxml
	gnome-base/libglade
	dev-python/libwnck-python"

src_unpack() {
	bzr_src_unpack
}
