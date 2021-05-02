# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Expands sinatra with standard helpers and tools to allow for complex applications"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0.9.2"
ruby_add_rdepend ">=dev-ruby/tilt-0.2"
ruby_add_rdepend ">=dev-ruby/thor-0.11.8"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/bundler-0.9.2"
ruby_add_rdepend ">=dev-ruby/haml-2.2.14"
ruby_add_rdepend ">=dev-ruby/shoulda-2.10.2"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.7"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.0"
ruby_add_rdepend ">=dev-ruby/webrat-0.5.1"
ruby_add_rdepend ">=dev-ruby/jeweler-0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/tmail-0"
ruby_add_rdepend ">=dev-ruby/xml-simple-0"
ruby_add_rdepend ">=dev-ruby/warden-0"

