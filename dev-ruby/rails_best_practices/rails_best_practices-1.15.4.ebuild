# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="a code metric tool for rails codes, written in Ruby"
HOMEPAGE="http://rails-bestpractices.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/code_analyzer-0.4.3"
ruby_add_rdepend ">=dev-ruby/colored-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/require_all-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"

