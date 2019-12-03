# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/Sirupsen/logrus"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Structured, pluggable logging for Go"
HOMEPAGE="https://github.com/sirupsen/logrus"
SRC_URI="https://github.com/sirupsen/logrus/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
