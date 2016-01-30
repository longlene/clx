# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils mercurial

DESCRIPTION="An extension for mercurial that gives graphical dialogs using the Qt4"
HOMEPAGE="http://bitbucket.org/bfrog/cutehg-stable/wiki/Home"
EHG_REPO_URI="http://bitbucket.org/bfrog/cutehg-stable/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/python-2.5
	dev-util/mercurial
	dev-python/PyQt4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/cutehg-stable"
