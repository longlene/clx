# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git distutils python

DESCRIPTION="shr pyphonelog-application"
HOMEPAGE="http://trac.shr-project.org/trac"

EGIT_REPO_URI="http://shr.bearstech.com/repo/pyphonelog.git"
EGIT_PROJECT="pyphonelog"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="dev-python/dbus-python
	dev-python/pygtk
	dev-lang/python[sqlite]"
DEPEND="dev-python/setuptools"


src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/pyphonelog-20090214-setup.py.patch
	epatch "${FILESDIR}"/pyphonelog-20090214-phonelog.patch
	python_version || die
	PVER=`echo "${PYVER}" | sed -e "s|[.]||"`
	if [ "${PVER}" -lt "26" ];
	then
		epatch "${FILESDIR}"/pyphonelog-20090214-python-2.5.patch
	fi
}

src_install() {
	distutils_src_install --prefix=/usr
}
