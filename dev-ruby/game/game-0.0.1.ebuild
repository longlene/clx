# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="# Game

A Ruby-powered MVC game framework"
HOMEPAGE="http://github.com/RyanScottLewis/game"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/version-1.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-2.1"
ruby_add_rdepend ">=dev-ruby/guard-yard-2.0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0.9"
ruby_add_rdepend ">=dev-ruby/fuubar-1.1"
ruby_add_rdepend ">=dev-ruby/github-markup-0.7"

