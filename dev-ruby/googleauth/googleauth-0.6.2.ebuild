# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="   Allows simple authorization for accessing Google APIs"
HOMEPAGE="https://github.com/google/google-auth-library-ruby"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.12"
ruby_add_rdepend ">=dev-ruby/logging-2.0"
ruby_add_rdepend "<dev-ruby/jwt-1.4"
ruby_add_rdepend ">=dev-ruby/memoist-0.12"
ruby_add_rdepend ">=dev-ruby/multi_json-1.11"
ruby_add_rdepend ">=dev-ruby/os-0.9"
ruby_add_rdepend ">=dev-ruby/signet-0.7"

