# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8a7332f8e5ba0ca3bc677a3d98d82f60b0f64bd6"

DESCRIPTION="Common Lisp port of box2d-lite"
HOMEPAGE="https://github.com/fouric/boxed2d"
SRC_URI="https://github.com/fouric/boxed2d/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
