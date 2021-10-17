# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vcs-snapshot vim-plugin

EGIT_COMMIT="8a5cb51fbb8d89b0151833a6deb654929818a964"

DESCRIPTION="vim plugin: Text outlining and task management for Vim based on Emacs' Org-Mode"
HOMEPAGE="https://github.com/jceb/vim-orgmode"
SRC_URI="https://github.com/jceb/vim-orgmode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_prepare() {
	eapply_user
	rm -r debian documentation examples tests
}
