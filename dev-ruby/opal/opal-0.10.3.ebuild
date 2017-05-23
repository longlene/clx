# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby runtime and core library for JavaScript"
HOMEPAGE="http://opalrb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sourcemap-0.1.0"
ruby_add_rdepend ">=dev-ruby/sprockets-3.1"
ruby_add_rdepend ">=dev-ruby/hike-1.2"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend "=dev-ruby/mspec-1.5.20"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/racc-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.99"
ruby_add_rdepend ">=dev-ruby/octokit-2.4.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/opal-minitest-0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"

