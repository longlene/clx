# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/jinzhu/inflection"
EGIT_COMMIT="1c35d901db3da928c72a72d8458480cc9ade058f"

DESCRIPTION="Pluralizes and singularizes English nouns"
HOMEPAGE="https://github.com/jinzhu/inflection"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
