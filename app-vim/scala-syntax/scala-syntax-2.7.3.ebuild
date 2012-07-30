# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2

inherit eutils vim-plugin

MY_P="scala-tool-support-${PV}.final"

DESCRIPTION="vim plugin: Scala syntax highlighting, filetype and indent settings"
HOMEPAGE="http://www.scala-lang.org/"
SRC_URI="http://www.scala-lang.org/downloads/distrib/files/scala-packages/${MY_P}.sbp -> ${MY_P}.zip"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/misc/scala-tool-support/vim/"

