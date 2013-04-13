# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM="git"

inherit kde4-base

DESCRIPTION="This plugin brings qml and JavaScript language support to KDevelop"
HOMEPAGE="https://projects.kde.org/projects/playground/devtools/plugins/kdev-qmljs"
SRC_URI=""

EGIT_REPO_URI="git://anongit.kde.org/kdev-qmljs"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-util/kdevelop-4.3.90"
RDEPEND="${DEPEND}"
