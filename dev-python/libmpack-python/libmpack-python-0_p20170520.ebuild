# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="881f7e3b81ac83a365d7e6c1e96c8f94d22c2e65"

DESCRIPTION="Python binding to libmpack"
HOMEPAGE="https://github.com/libmpack/libmpack-python"
SRC_URI="https://github.com/libmpack/libmpack-python/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/autopxd
"
RDEPEND="${DEPEND}"
