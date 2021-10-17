# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mattn/memo"

DESCRIPTION="Memo Life For You"
HOMEPAGE="https://github.com/mattn/memo"
SRC_URI="https://github.com/mattn/memo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/toml
	dev-go/browser
	dev-go/github_flavored_markdown
"
RDEPEND="${DEPEND}"
