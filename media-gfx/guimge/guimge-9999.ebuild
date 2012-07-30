# Copyright 2007-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils git

EGIT_REPO_URI="git://github.com/Apkawa/guimge.git"

DESCRIPTION="Python picture uploader to different imagehostings"
HOMEPAGE="http://code.google.com/p/uimge"

IUSE=""
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	media-gfx/uimge
	dev-python/pygtk
	"

DEPEND="${RDEPEND}
	dev-python/setuptools"

src_prepare() {
	# without this icon GUI does not work
	[ -e guimge/icons/hosts/clip2net.com.png ] || wget clip2net.com/favicon.ico -O guimge/icons/hosts/clip2net.com.png
}