# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" webmachine is a toolkit for building HTTP applications in a declarative fashion, that avoids the confusion of going through a CGI-style interface like Rack"
HOMEPAGE="http://github.com/seancribbs/webmachine-ruby"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/i18n-0.4.0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/as-notifications-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.12.0"
ruby_add_rdepend ">=dev-ruby/yard-0.7.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rack-0"

