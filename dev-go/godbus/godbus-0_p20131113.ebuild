# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/guelfey/go.dbus"
EGIT_COMMIT="f6a3a2366cc39b8479cadc499d3c735fb10fbdda"

DESCRIPTION="Native Go bindings for D-Bus"
HOMEPAGE="https://github.com/guelfey/go.dbus"
SRC_URI="https://github.com/guelfey/go.dbus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
