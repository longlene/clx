# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

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

ruby_add_rdepend "=dev-ruby/pakyow-support-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-core-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-presenter-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-mailer-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-realtime-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-ui-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-rake-0.10.2"
ruby_add_rdepend "=dev-ruby/pakyow-test-0.10.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.10"

