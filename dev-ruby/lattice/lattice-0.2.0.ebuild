# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A concurrent realtime web framework for Ruby"
HOMEPAGE="https://github.com/tarcieri/lattice"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.0.0"
ruby_add_rdepend ">=dev-ruby/celluloid-0.15.1"
ruby_add_rdepend ">=dev-ruby/colorize-0.5.0"
ruby_add_rdepend ">=dev-ruby/reel-0.4.0"
ruby_add_rdepend ">=dev-ruby/thor-0.18.0"
ruby_add_rdepend ">=dev-ruby/webmachine-1.2.1"

