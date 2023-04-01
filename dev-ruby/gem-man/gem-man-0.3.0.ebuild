# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The \`gem man\` command can be used to display a man page for an installed RubyGem"
HOMEPAGE="https://github.com/defunkt/gem-man"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


