# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem bash-completion-r1 fish-completion

DESCRIPTION="Create and manage complex tmux sessions easily"
HOMEPAGE="https://github.com/tmuxinator/tmuxinator"
SRC_URI="https://github.com/tmuxinator/tmuxinator/archive/v${PV}.tar.gz -> ${P}.tar.gz"
IUSE="bash-completion fish-completion zsh-completion"
SLOT="0"

LICENSE="as-is"
KEYWORDS="~amd64 ~x86 ~arm"
RDEPEND="
zsh-completion? ( app-shells/zsh )
fish-completion? ( app-shells/fish )
"

ruby_add_rdepend "
>=dev-ruby/thor-0.15.0
>=dev-ruby/erubis-2.6"

all_ruby_prepare() {
	rm bin/mux
}

all_ruby_install() {
	all_fakegem_install
	if use bash-completion ; then
		dobashcomp completion/tmuxinator.bash
	elif use fish-completion ; then
		dofishcomp completion/tmuxinator.fish
	elif use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins completion/tmuxinator.zsh
	fi
}
