# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A beautiful and powerful interactive command line prompt with a robust API for getting and validating complex inputs"
HOMEPAGE="https://piotrmurach.github.io/tty"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/necromancer-0.3.0"
ruby_add_rdepend ">=dev-ruby/pastel-0.6.0"
ruby_add_rdepend ">=dev-ruby/tty-cursor-0.3.0"
ruby_add_rdepend ">=dev-ruby/wisper-1.6.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.5.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.5.0"

