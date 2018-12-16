# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Bring your event data into Jekyll for amazing event websites"
HOMEPAGE="https://attendease.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0.13.1"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.9"
ruby_add_rdepend ">=dev-ruby/redcarpet-2.3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend "=dev-ruby/jekyll-1.5.1"

