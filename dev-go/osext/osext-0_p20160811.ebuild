# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/kardianos/osext"
EGIT_COMMIT="c2c54e542fb797ad986b31721e1baedf214ca413"

DESCRIPTION="Extensions to the standard \"os\" package"
HOMEPAGE="https://github.com/kardianos/osext"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
