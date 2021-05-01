# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ad2373918643fe0cdac28332c0a93506b5631edc"

DESCRIPTION="A Common Lisp Ray-Tracer"
HOMEPAGE="https://github.com/nowl/elray"
SRC_URI="https://github.com/nowl/elray/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
