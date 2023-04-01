# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Docker client"
HOMEPAGE="https://github.com/geku/docker-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.13"
ruby_add_rdepend ">=dev-ruby/vcr-2.5"
ruby_add_rdepend ">=dev-ruby/webmock-1.11"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2.13"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/curb-0.8.4"

