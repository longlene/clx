# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A client for Kubernetes REST api"
HOMEPAGE="https://github.com/abonas/kubeclient"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/webmock-1.24.2"
ruby_add_rdepend ">=dev-ruby/vcr-0"
ruby_add_rdepend "=dev-ruby/rubocop-0.30.0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend "=dev-ruby/recursive-open-struct-1.0.0"
ruby_add_rdepend "=dev-ruby/http-0.9.8"

