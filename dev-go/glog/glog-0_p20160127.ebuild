# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/golang/glog"
EGIT_COMMIT="23def4e6c14b4da8ac2ed8007337bc5eb5007998"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
