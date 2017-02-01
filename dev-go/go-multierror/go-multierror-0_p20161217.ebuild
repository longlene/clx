# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/hashicorp/go-multierror"
EGIT_COMMIT="ed905158d87462226a13fe39ddf685ea65f1c11f"

DESCRIPTION="A Go package for representing a list of errors as a single error"
HOMEPAGE="https://github.com/hashicorp/go-multierror"
SRC_URI="https://github.com/hashicorp/go-multierror/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
