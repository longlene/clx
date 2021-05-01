# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9f99bf37c36d46f585ca846939de93dbf7dfb20d"

DESCRIPTION="A collection of utilities to process lambda-lists"
HOMEPAGE="http://shinmera.github.io/lambda-fiddle"
SRC_URI="http://github.com/Shinmera/lambda-fiddle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
