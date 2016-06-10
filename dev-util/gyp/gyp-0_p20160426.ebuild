# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Generate Your Projects"
HOMEPAGE="https://gyp.gsrc.io"

SRC_URI=""
EGIT_REPO_URI="https://chromium.googlesource.com/external/${PN}"
EGIT_COMMIT="e24c837"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
