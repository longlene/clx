# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a RubyVersion class to simplify checking for the right Ruby version in your programs"
HOMEPAGE="https://github.com/janlelis/ruby_version"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rdoc-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.4"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0.2"

