# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RSense is a tool for doing static analysis of Ruby source code"
HOMEPAGE=""

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rsense-core-0.6.6"
ruby_add_rdepend ">=dev-ruby/rsense-server-0.5.18"
ruby_add_rdepend ">=dev-ruby/spoon-0.0.4"
ruby_add_rdepend ">=dev-ruby/jruby-jars-1.7.4"
ruby_add_rdepend ">=dev-ruby/jruby-parser-0.5.4"
ruby_add_rdepend ">=dev-ruby/thor-0.18.1"
ruby_add_rdepend ">=dev-ruby/filetree-1.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-minitest-0"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

