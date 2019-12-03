# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mattn/go-xmpp"
EGIT_COMMIT="6093f50721ed2204a87a81109ca5a466a5bec6c1"


DESCRIPTION="go xmpp library"
HOMEPAGE="https://github.com/mattn/go-xmpp"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
