# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d268375df93bb1b1530b48d8654fa92b203c6e00"

DESCRIPTION="esoteric CL essentials"
HOMEPAGE="https://github.com/codr4life/cl4l"
SRC_URI="https://github.com/codr4life/cl4l/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
