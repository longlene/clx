# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rom-2.0"
ruby_add_rdepend ">=dev-ruby/rom-support-2.0"
ruby_add_rdepend ">=dev-ruby/rom-model-0.3"
ruby_add_rdepend ">=dev-ruby/dry-equalizer-0.2"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/charlatan-0.1"
ruby_add_rdepend ">=dev-ruby/virtus-1.0"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.28"

