# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/slyrus/opticl-core.git"
else
	inherit vcs-snapshot
	EGIT_COMMIT="1db9a548a892f051bd2b02661b63200bf212a715"
	SRC_URI="https://github.com/slyrus/opticl-core/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi


DESCRIPTION="Core classes and pixel access macros from opticl"
HOMEPAGE="https://github.com/slyrus/opticl-core"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

