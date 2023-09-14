# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="A Window Manager Toolkit for Guile Scheme"
HOMEPAGE="https://github.com/mwitmer/guile-wm"
SRC_URI="https://github.com/mwitmer/guile-wm/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-scheme/guile
dev-scheme/guile-xcb
"
