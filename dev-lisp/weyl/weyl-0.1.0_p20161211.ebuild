# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="299898c075795a7fb0b06907e6db13158e06b686"

DESCRIPTION="A computer algebra substrate"
HOMEPAGE="https://github.com/OdonataResearchLLC/weyl"
SRC_URI="https://github.com/OdonataResearchLLC/weyl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"
