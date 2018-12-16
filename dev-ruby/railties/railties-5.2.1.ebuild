# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rails internals: application bootup, plugins, generators, and rake tasks"
HOMEPAGE="http://rubyonrails.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-5.2.1"
ruby_add_rdepend ">=dev-ruby/actionpack-5.2.1"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/thor-0.19.0"
ruby_add_rdepend ">=dev-ruby/method_source-0"
ruby_add_rdepend "=dev-ruby/actionview-5.2.1"

