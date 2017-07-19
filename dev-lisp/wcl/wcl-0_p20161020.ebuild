# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="65517112a62f36309801b8f27072c0adcc5f1086"

DESCRIPTION="WCL Common Lisp"
HOMEPAGE="https://github.com/wadehennessey/wcl"
SRC_URI="https://github.com/wadehennessey/wcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-shells/tcsh
"
RDEPEND="${DEPEND}"
