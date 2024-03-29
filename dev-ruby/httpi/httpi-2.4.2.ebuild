# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Common interface for Ruby's HTTP libraries"
HOMEPAGE="http://github.com/savonrb/httpi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/socksify-0"
ruby_add_rdepend ">=dev-ruby/rubyntlm-0.3.2"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/mocha-0.13"
ruby_add_rdepend ">=dev-ruby/puma-2.3.2"
ruby_add_rdepend ">=dev-ruby/webmock-0"

