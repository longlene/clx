# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Modern web framework for Ruby"
HOMEPAGE="http://pakyow.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/pakyow-support-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-core-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-presenter-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-mailer-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-realtime-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-ui-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-rake-0.11.3"
ruby_add_rdepend "=dev-ruby/pakyow-test-0.11.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

