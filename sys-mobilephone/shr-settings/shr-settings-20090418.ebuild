# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git distutils

DESCRIPTION="shr-settings; a gui for changing phone settings from the shr-project"
HOMEPAGE="http://trac.shr-project.org/trac"

EGIT_REPO_URI="http://shr.bearstech.com/repo/shr-settings.git"
EGIT_TREE="709fc633f1234d86ec84fc41a1821e4646e5e5a4"
EGIT_PROJECT="shr-settings"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

RDEPEND="dev-python/dbus-python
	>=dev-python/python-elementary-20090127-r38808
	>=dev-python/python-edje-20090201-r38885
	>=dev-python/python-e_dbus-20090201-r38885
	>=dev-python/python-ecore-20090201-r38885"
DEPEND="dev-python/setuptools"


src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack
	cd "${S}"
	epatch "${FILESDIR}/${PF}"-setup.py.patch
}

src_install() {
	distutils_src_install
}
