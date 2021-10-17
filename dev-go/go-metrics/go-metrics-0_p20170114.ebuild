# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/armon/go-metrics"
EGIT_COMMIT="93f237eba9b0602f3e73710416558854a81d9337"

DESCRIPTION="A Golang library for exporting performance and runtime metrics to external metrics systems"
HOMEPAGE="https://github.com/armon/go-metrics"
SRC_URI="https://github.com/armon/go-metrics/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
