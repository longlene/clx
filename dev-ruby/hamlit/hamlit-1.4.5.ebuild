# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="High Performance Haml Implementation"
HOMEPAGE="https://github.com/k0kubun/hamlit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/escape_utils-0"
ruby_add_rdepend ">=dev-ruby/temple-0.7.3"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/faml-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/less-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/tenjin-0"
ruby_add_rdepend ">=dev-ruby/therubyracer-0"
ruby_add_rdepend ">=dev-ruby/unindent-0"

