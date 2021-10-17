# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/karalabe/gousb/..."
EGIT_COMMIT="ffa821b2e25aa1828ffca731f759a1ebfa410d73"

DESCRIPTION="Idiomatic Go bindings for libusb"
HOMEPAGE=""https://github.com/karalabe/gousb
SRC_URI="https://github.com/karalabe/gousb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
