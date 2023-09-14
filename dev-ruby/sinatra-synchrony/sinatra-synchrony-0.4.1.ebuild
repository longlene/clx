# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bootstraps in code required to take advantage of EventMachine/EM-Synchrony's concurrency enhancements for slow IO"
HOMEPAGE="https://github.com/kyledrake/sinatra-synchrony"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.0"
ruby_add_rdepend ">=dev-ruby/rack-fiber_pool-0.9"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0"
ruby_add_rdepend ">=dev-ruby/em-synchrony-1.0.1"
ruby_add_rdepend ">=dev-ruby/em-resolv-replace-1.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5"
ruby_add_rdepend ">=dev-ruby/wrong-0.5"
ruby_add_rdepend ">=dev-ruby/minitest-0"

