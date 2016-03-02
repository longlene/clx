# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Use Fasterer to check various places in your code that could be faster"
HOMEPAGE="https://github.com/DamirSvrtan/fasterer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/colorize-0.7"
ruby_add_rdepend ">=dev-ruby/ruby_parser-3.7"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"

