# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/tarm/serial"
EGIT_COMMIT="37be519d49878d0098e34fb614136b81e6c87861"

DESCRIPTION="A Go package to allow you to read and write from the serial port as a stream of bytes"
HOMEPAGE="https://github.com/tarm/serial"
SRC_URI="https://github.com/tarm/serial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
