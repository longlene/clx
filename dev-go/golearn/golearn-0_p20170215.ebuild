# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/sjwhitworth/golearn/..."
EGIT_COMMIT="9884cbc086ef4304cf269aa2a750581126025aa7"

DESCRIPTION="Machine Learning for Go"
HOMEPAGE="https://github.com/sjwhitworth/golearn"
SRC_URI="https://github.com/sjwhitworth/golearn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	"github.com/gonum/floats" in any of:
	 package "github.com/gonum/internal/asm/f32" in any of:
	e "github.com/gonum/internal/asm/f64" in any of:
"
RDEPEND="${DEPEND}"
