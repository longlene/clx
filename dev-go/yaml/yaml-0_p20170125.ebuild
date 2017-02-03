# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="gopkg.in/yaml.v2"
EGIT_COMMIT="4c78c975fe7c825c6d1466c42be594d1d6f3aba6"

DESCRIPTION="YAML support for the Go language"
HOMEPAGE="https://github.com/go-yaml/yaml"
SRC_URI="https://github.com/go-yaml/yaml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
