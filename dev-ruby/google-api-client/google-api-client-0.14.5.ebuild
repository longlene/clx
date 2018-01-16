# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/google/google-api-ruby-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/representable-3.0"
ruby_add_rdepend ">=dev-ruby/retriable-2.0"
ruby_add_rdepend ">=dev-ruby/addressable-2.5"
ruby_add_rdepend ">=dev-ruby/mime-types-3.0"
ruby_add_rdepend ">=dev-ruby/googleauth-0.5"
ruby_add_rdepend ">=dev-ruby/httpclient-2.8.1"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"

