# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"
RESTRICT_PYTHON_ABIS="3.*"

EGIT_REPO_URI="git://github.com/nsmgr8/${PN}.git"

inherit distutils git-2

DESCRIPTION="Qt Bugs Everywhere (qtbe) is a graphical user interface for the bug tracking system Bugs Everywhere (BE)."
HOMEPAGE="https://github.com/nsmgr8/qtbe"
SRC_URI=""

IUSE=""
SLOT="0"
KEYWORDS=""
LICENSE="GPL2"

DEPEND="dev-python/pyside dev-util/bugseverywhere"
RDEPEND="${DEPEND}"
