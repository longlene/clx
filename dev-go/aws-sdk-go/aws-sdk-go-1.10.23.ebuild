# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/aws/aws-sdk-go/..."

DESCRIPTION="AWS SDK for the Go programming language"
HOMEPAGE="https://github.com/aws/aws-sdk-go"
SRC_URI="https://github.com/aws/aws-sdk-go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
